package collatzconjecture

import (
	"errors"
)

func CollatzConjecture(N int) (int, error) {
	if N <= 0 {
		err := errors.New("input N should be > 0.")
		return 0, err
	}
	steps := 0
	for {
		if steps > 1000 {
			break
		}
		if N <= 1 {
			break
		}
		steps++
		if (N % 2) == 0 {
			N = N / 2
			continue
		} else {
			N = (N * 3) + 1
			continue
		}
	}
	return steps, nil
}
