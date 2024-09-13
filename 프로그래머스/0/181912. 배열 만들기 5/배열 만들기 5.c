#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <math.h>

// intStrs_len은 배열 intStrs의 길이입니다.
// 파라미터로 주어지는 문자열은 const로 주어집니다. 변경하려면 문자열을 복사해서 사용하세요.
int* solution(const char* intStrs[], size_t intStrs_len, int k, int s, int l) {
    // return 값은 malloc 등 동적 할당을 사용해주세요. 할당 길이는 상황에 맞게 변경해주세요.
    int* answer = (int*)malloc(sizeof(int) * intStrs_len);
    int temp;
    int len;
    char num[2];
    int idx = 0;
    int i;
    for (int j = 0; j < intStrs_len; j++) {
        temp = 0;
        len = l - 1;
        for (i = s; i < s + l; i++) {
            num[0] = intStrs[j][i];
            num[1] = '\0';
            temp += atoi(num) * pow(10, len--);
        }
        if (temp > k){
            answer[idx++] = temp;
        }
    }
    
    answer[idx] = '\0';
    return answer;
}