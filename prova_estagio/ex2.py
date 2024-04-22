myNumber = int(input("Insira um número: "))

if(myNumber == 0 or myNumber == 1):
    print(F"O número '{myNumber}' faz parte da sequência de Fibonacci")
else:
    primeiro = 0
    segundo = 1
    fibonacci = primeiro + segundo

    while (fibonacci < myNumber):
        newFibo = fibonacci + segundo

        primeiro = segundo
        segundo = fibonacci
        fibonacci = newFibo
        print(fibonacci)

    if (fibonacci == myNumber):
        print(F"O número '{myNumber}' faz parte da sequência de Fibonacci")
    else:
         print(F"O número '{myNumber}' NÃO faz parte da sequência de Fibonacci")