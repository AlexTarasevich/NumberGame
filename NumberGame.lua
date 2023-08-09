
math.randomseed(os.time())
math.random()

tries = 10 -- кол-во попыток всего
bad = 0    --кол-во штрафных баллов
good = 0 -- кол-во выйгрышных баллов
rounds = 0 --кол- во раундов всего их 4



print("Введите наименьшее целое число диапазона: ")
a = io.read()
print("Наименьшее число =  " .. a)


print("Введите наибольшее целое число диапазона: ")
b = io.read()
print("Наибольшее число =  " .. b)


tonumber(a, b)
num = math.random(a, b) -- нахождение произвольного числа от 


function Number_read (num) -- основная функция нахождения числа
    print(num)
    return tonumber(io.read())
end


print(string.format('Игра началась! Угадайте число от %i до %i. В игре всего 4 раунда, по 10 попыток каждый', a, b))


repeat -- цикл, в котором происходит игра. Длится пока не закончатся раунды или кол-во плохих или хороших баллов не будет равно 4
    guess = Number_read("Напиши число: ")


    if guess > num then
        tries = tries - 1
        print(string.format("Нет, нужно меньше! Осталось %i попыток до конца раунда", tries))
    elseif guess < num then
        tries = tries - 1
        print(string.format("Нет, нужно больше! Осталось %i попыток до конца раунда", tries))
    elseif guess == num then
        num = math.random(a, b) -- выбор нового рандомного числа из диапозона 
        good = good + 1
        rounds = rounds + 1
        tries = 0
        tries = tries + 10
        print(string.format("Вы выйграли этот раунд! Раунд %i из 4 И вам начислено хороших очков %i", rounds, good))

        
    end


    if (tries == 0) then
       -- print(string.format("У вас закончились попытки, раунд завершился")) -- окончание игры если закончились попытки
        bad = bad + 1
        rounds = rounds + 1
        tries = tries + 10
        print(string.format("Раунд №%i завершился т.к закончились попытки, хороших очков у вас: %i, плохих очков: %i",
            rounds,
            good, bad)) -- окончание игры если закончились попытки
    end
until good == 4 or bad == 4 or rounds == 4


if (rounds == 4) then
    print(string.format("Коней игры, закончились все раунды. Ваш счет - хорошие баллы: %i полхие баллы: %i", good, bad))
elseif (good == 4) then
    print(string.format("Вы выйграли игру! У вас хороших очков: %i плохих очков: %i попыток", good, bad))

elseif (bad == 4) then
    print(string.format("Вы проиграли игру у вас слишком много штрафный баллов %i", bad))

elseif (bad == 2 or good == 2) then
    print(string.format("Ничья! Колличество хороших баллов %i и полхих %i равны", good, bad))

elseif (bad == 3 or good == 1) then
    print(string.format("Вы проиграли игру у вас слишком много штрафный баллов %i, а хороших слишком мало %i", bad, good))

elseif (bad == 1 or good == 3) then
    print(string.format("Вы выйграли игру у вас хороших баллов %i больше чем штрафных %i ", good, bad))

end
