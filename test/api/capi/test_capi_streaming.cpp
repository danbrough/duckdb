#include "capi_tester.hpp"
#include "duckdb.h"

using namespace duckdb;
using namespace std;

TEST_CASE("Test streaming results in C API", "[capi]") {
	CAPITester tester;
	CAPIPrepared prepared;
	CAPIPending pending;
	unique_ptr<CAPIResult> result;

	// open the database in in-memory mode
	REQUIRE(tester.OpenDatabase(nullptr));
	REQUIRE(prepared.Prepare(tester, "SELECT i::UINT32 FROM range(1000000) tbl(i)"));
	REQUIRE(pending.PendingStreaming(prepared));

	while (true) {
		auto state = pending.ExecuteTask();
		REQUIRE(state != DUCKDB_PENDING_ERROR);
		if (state == DUCKDB_PENDING_RESULT_READY) {
			break;
		}
	}

	result = pending.CreateStream();
	REQUIRE(result);
	REQUIRE(!result->HasError());
	auto chunk = result->FetchChunk();

	idx_t value = duckdb::DConstants::INVALID_INDEX;
	idx_t chunk_count = 0;
	while (chunk) {
		auto old_value = value;

		auto vector = chunk->GetVector(0);
		uint32_t *data = (uint32_t *)duckdb_vector_get_data(vector);
		value = data[0];
		if (old_value != duckdb::DConstants::INVALID_INDEX) {
			// We select from a range, so we can expect every starting value of a new chunk to be higher than the last
			// one.
			REQUIRE(value > old_value);
		}
		chunk_count++;
		chunk = result->FetchChunk();
	}
}
