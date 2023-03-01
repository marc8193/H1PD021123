namespace program
{
    class Calculator
    {
        static int Calc(int num1, int num2, string symbol)
        {
            int res = 0;

            switch (symbol)
            {
                case "+":
                    res = num1 + num2;
                    Console.WriteLine("Addition:" + res);
                    break;
                case "-":
                    res = num1 - num2;
                    Console.WriteLine("Subtraction:" + res);
                    break;
                case "*":
                    res = num1 * num2;
                    Console.WriteLine("Multiplication:" + res);
                    break;
                case "/":
                    res = num1 / num2;
                    Console.WriteLine("Division:" + res);
                    break;
                default:
                    Console.WriteLine("Wrong input");
                    break;
            }

            return res;
        }

        static void Main(string[] args)
        {
            Console.Write("Enter first number:");
            int num1 = Convert.ToInt32(Console.ReadLine());

            Console.Write("Enter second number:");
            int num2 = Convert.ToInt32(Console.ReadLine());

            Console.Write("Enter symbol(/,+,-,*):");
            string symbol = Console.ReadLine();

            Calc(num1, num2, symbol);
        }
    }
}