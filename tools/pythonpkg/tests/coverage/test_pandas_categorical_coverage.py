import duckdb
import pandas as pd
import numpy
import pytest

def check_create_table(category):
    conn = duckdb.connect()

    conn.execute ("PRAGMA enable_verification")
    df_in = pd.DataFrame({
    'x': pd.Categorical(category, ordered=True),
    'y': pd.Categorical(category, ordered=True)
    })

    df_out = duckdb.query_df(df_in, "data", "SELECT * FROM data").df()
    assert df_in.equals(df_out)

    conn.execute("CREATE TABLE t1 AS SELECT * FROM df_in")
    conn.execute("CREATE TABLE t2 AS SELECT * FROM df_in")

    # Do a insert to trigger string -> cat 
    conn.execute("INSERT INTO t1 VALUES ('2','2')")

    res = conn.execute("SELECT x FROM t1 where x = '1'").fetchall()
    assert res == [('1',)]

    res =  conn.execute("SELECT t1.x FROM t1 inner join t2 on (t1.x = t2.x)").fetchall()
    assert res == conn.execute("SELECT x FROM t1").fetchall()
    
    res = conn.execute("SELECT t1.x FROM t1 inner join t2 on (t1.x = t2.y) order by t1.x").fetchall()
    correct_res = conn.execute("SELECT x FROM t1 order by x").fetchall()
    assert res == correct_res
    # Triggering the cast with ENUM as a src
    conn.execute("ALTER TABLE t1 ALTER x SET DATA TYPE VARCHAR")
    # We should be able to drop the table without any dependencies
    conn.execute("DROP TABLE t1")

class TestCategory(object):

    def test_category_string_uint16(self, duckdb_cursor):
        category = []
        for i in range (300):
            category.append(str(i))
        check_create_table(category)

    def test_category_string_uint32(self, duckdb_cursor):
        category = []
        for i in range (70000):
            category.append(str(i))
        check_create_table(category)