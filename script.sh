g++-13 --std=c++20 -O2 -O3 -Ofast a.cpp -o a.out
g++-13 --std=c++20 -O2 -O3 -Ofast b.cpp -o b.out
for ((i = 0; ; i++)) do
    echo "Testing $i";
    python3 gen.py i > in.txt;
    ./a.out < in.txt > out1.txt;
    ./b.out < in.txt > out2.txt;
    diff -w out1.txt out2.txt || break;
done
echo "--------------------------------------------------------";
echo "Input: ";
cat in.txt;
echo "Expected Output: ";
cat out1.txt;
echo "Received Output: ";
cat out2.txt;
