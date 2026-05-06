contract Contract {

    function filterEven(uint[] calldata numbers) external pure returns (uint[] memory) {
        uint evenCount = 0;

        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evenCount++;
            }
        }

        uint[] memory evens = new uint[](evenCount);
        uint currentIndex = 0;

        
        for (uint i = 0; i < numbers.length; i++) {
            if (numbers[i] % 2 == 0) {
                evens[currentIndex] = numbers[i];
                currentIndex++;
            }
        }

        return evens;
    }
}
