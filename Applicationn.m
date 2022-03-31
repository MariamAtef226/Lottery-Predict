%1st: determining probability of winning first prize (for players)
start=input('Enter the start of the range you are allowed to pick numbers from ');
ending=input('Enter the end of that range ');
x=ending-start-5;
sum=0.0;
for n = 0 : 6
    sum = sum + (factorial(x) / (factorial(x - 6 + n)*factorial(6 - n))) * (factorial(6)/(factorial(6 - n)*factorial(n)));
end
probwin = 1/sum;
disp(['probability of a ticket to be the winning one = ', num2str(probwin)])
if probwin > 1/593775
    disp('Go for it and purchase one or more tickets!')
else
    disp('Reconsider it or purchase ONLY one ticket!')
end

%2nd: determining the expected pay-off for every player and risk of investment:
mean = 0;
mean2 = 0;
for n = 0 : 6
    prompt = ['Enter pay off value for ',num2str(n),' matching numbers! '];
    pay = input(prompt);
    prob = ((factorial(x) / (factorial(x - 6 + n)*factorial(6 - n))) * (factorial(6)/(factorial(6 - n)*factorial(n)))/sum);
    mean = mean + prob*pay;
    mean2 = mean2 + power(pay,2) * prob;
end
disp(['The average pay-off you will get = ',num2str(mean),'$'])
var = mean2 - power(mean , 2);
standdev = power(var , 0.5);
disp(['The risk of investment: The payoff deviates by ',num2str(standdev)])
if standdev > 100*mean
    disp('It is a relatively high risk')
else
    disp('Risk is relatively not very high!')
end