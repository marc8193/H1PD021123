using System;
using System.Runtime.InteropServices;
using GPOpgaver;

namespace GPOpgaver
{
    class Program
    {

        static void Main(string[] args)
        {
            string input = Console.ReadLine();

            Console.WriteLine($"Is string palindrome => {Opgaver.IsPalindrome(input)}");
        }
    }
}
