//===----------------------------------------------------------------------===//
//                         DuckDB
//
// duckdb/function/cast/default_casts.hpp
//
//
//===----------------------------------------------------------------------===//

#pragma once

#include "duckdb/common/types.hpp"
#include "duckdb/common/types/vector.hpp"

namespace duckdb {
class CastFunctionSet;

//! Extra data that can be attached to a bind function of a cast, and is available during binding
struct BindCastInfo {
	DUCKDB_API virtual ~BindCastInfo();
};

//! Extra data that can be returned by the bind of a cast, and is available during execution of a cast
struct BoundCastData {
	DUCKDB_API virtual ~BoundCastData();

	DUCKDB_API virtual unique_ptr<BoundCastData> Copy() const = 0;
};

struct CastParameters {
	CastParameters() {}
	CastParameters(CastParameters &parent, BoundCastData *cast_data = nullptr) :
		cast_data(cast_data), strict(parent.strict), error_message(parent.error_message) {}

	//! The bound cast data (if any)
	BoundCastData *cast_data = nullptr;
	//! whether or not to enable strict casting
	bool strict = false;
	// out: error message in case cast has failed
	string *error_message = nullptr;
};

typedef bool (*cast_function_t)(Vector &source, Vector &result, idx_t count, CastParameters &parameters);

struct BoundCastInfo {
	BoundCastInfo(cast_function_t function, unique_ptr<BoundCastData> cast_data = nullptr); // NOLINT: allow explicit cast from cast_function_t

	cast_function_t function;
	unique_ptr<BoundCastData> cast_data;

public:
	BoundCastInfo Copy() const;
};

struct BindCastInput {
	BindCastInput(CastFunctionSet &function_set, BindCastInfo *info) : function_set(function_set), info(info) {}

	CastFunctionSet &function_set;
	BindCastInfo *info;
};

struct DefaultCasts {
	static BoundCastInfo GetDefaultCastFunction(BindCastInput &input, const LogicalType &source, const LogicalType &target);

	static bool NopCast(Vector &source, Vector &result, idx_t count, CastParameters &parameters);
	static bool TryVectorNullCast(Vector &source, Vector &result, idx_t count, CastParameters &parameters);

private:
	static BoundCastInfo NumericCastSwitch(BindCastInput &input, const LogicalType &source, const LogicalType &target);
	static BoundCastInfo StructCastSwitch(BindCastInput &input, const LogicalType &source, const LogicalType &target);
	static BoundCastInfo UUIDCastSwitch(BindCastInput &input, const LogicalType &source, const LogicalType &target);
};


} // namespace duckdb
