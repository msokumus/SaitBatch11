AccountsBatch ab = new AccountsBatch();
Id batchId = database.executeBatch(ab, 10); // 10 ar 10 ar calisir. bunu yazmazsak default olarak 200 calisir.