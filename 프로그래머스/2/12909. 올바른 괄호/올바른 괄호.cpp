#include <string>
#include <iostream>
#include <stack>

using namespace std;

bool solution(string s)
{
    bool answer = true;
    stack<char> stk;
    for(int i=0; i<s.size(); i++){
        if(s[i] == ')' && stk.empty()) return false;
        if(s[i] == '('){
            stk.push(s[i]);
        }

        else{
            if(stk.top() == '('){ 
                stk.pop();
            }
            else{
                stk.push(s[i]);
            }
        }
    }

    if(!stk.empty()) answer = false;

    return answer;
}