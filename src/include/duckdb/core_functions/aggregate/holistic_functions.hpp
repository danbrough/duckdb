//===----------------------------------------------------------------------===//
//                         DuckDB
//
// duckdb/core_functions/aggregate/holistic_functions.hpp
//
//
//===----------------------------------------------------------------------===//
// This file is automatically generated by scripts/generate_functions.py
// Do not edit this file manually, your changes will be overwritten
//===----------------------------------------------------------------------===//

#pragma once

#include "duckdb/function/function_set.hpp"

namespace duckdb {

struct ApproxQuantileFun {
	static constexpr const char *Name = "approx_quantile";
	static constexpr const char *Parameters = "x,pos";
	static constexpr const char *Description = "Computes the approximate quantile using T-Digest.";
	static constexpr const char *Example = "approx_quantile(A,0.5)";

	static AggregateFunctionSet GetFunctions();
};

struct MadFun {
	static constexpr const char *Name = "mad";
	static constexpr const char *Parameters = "x";
	static constexpr const char *Description = "Returns the median absolute deviation for the values within x. NULL values are ignored. Temporal types return a positive INTERVAL.	";
	static constexpr const char *Example = "MEDIAN(ABS(x-MEDIAN(x)))";

	static AggregateFunctionSet GetFunctions();
};

struct MedianFun {
	static constexpr const char *Name = "median";
	static constexpr const char *Parameters = "x";
	static constexpr const char *Description = "Returns the middle value of the set. NULL values are ignored. For even value counts, quantitiative values are averaged and ordinal values return the lower value.";
	static constexpr const char *Example = "QUANTILE_CONT(x, 0.5)";

	static AggregateFunctionSet GetFunctions();
};

struct ModeFun {
	static constexpr const char *Name = "mode";
	static constexpr const char *Parameters = "x";
	static constexpr const char *Description = "Returns the most frequent value for the values within x. NULL values are ignored.";
	static constexpr const char *Example = "";

	static AggregateFunctionSet GetFunctions();
};

struct QuantileDiscFun {
	static constexpr const char *Name = "quantile_disc";
	static constexpr const char *Parameters = "x,pos";
	static constexpr const char *Description = "Returns the exact quantile number between 0 and 1 . If pos is a LIST of FLOATs, then the result is a LIST of the corresponding exact quantiles.";
	static constexpr const char *Example = "";

	static AggregateFunctionSet GetFunctions();
};

struct QuantileFun {
	using ALIAS = QuantileDiscFun;

	static constexpr const char *Name = "quantile";
};

struct QuantileContFun {
	static constexpr const char *Name = "quantile_cont";
	static constexpr const char *Parameters = "x,pos";
	static constexpr const char *Description = "Returns the intepolated quantile number between 0 and 1 . If pos is a LIST of FLOATs, then the result is a LIST of the corresponding intepolated quantiles.	";
	static constexpr const char *Example = "";

	static AggregateFunctionSet GetFunctions();
};

struct ReservoirQuantileFun {
	static constexpr const char *Name = "reservoir_quantile";
	static constexpr const char *Parameters = "x,quantile,sample_size";
	static constexpr const char *Description = "Gives the approximate quantile using reservoir sampling, the sample size is optional and uses 8192 as a default size.";
	static constexpr const char *Example = "reservoir_quantile(A,0.5,1024)";

	static AggregateFunctionSet GetFunctions();
};

enum class QuantileSerializationType : uint8_t {
	NON_DECIMAL = 0,
	DECIMAL_DISCRETE,
	DECIMAL_DISCRETE_LIST,
	DECIMAL_CONTINUOUS,
	DECIMAL_CONTINUOUS_LIST
};

} // namespace duckdb
