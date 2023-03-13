using TECHCOOL;

SQLet.ConnectSqlServer("h1pd021123", "docker.data.techcollege.dk", "h1pd021123", "h1pd021123_Jokes");

//SQLet.Execute("insert into Jokes (Jokes) Values ('en datatekniker, itsupporter...')");

var res = SQLet.GetResult("SELECT joke FROM jokes");

foreach (var row in res)
{
    Console.WriteLine(row["Jokes"]);
}