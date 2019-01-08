// Solution for https://www.codewars.com/kata/564057bc348c7200bd0000ff


const int reminders[6] = {1, 10, 9, 12, 3, 4};
const int base = 10;

class Thirteen
{

public:
    static long long thirt(long long n){
      
      long previous;
      long calculated = 0;
      long captured = n;
      
      while(previous!=calculated) {
        
        int idx = 0;
        calculated = 0;
        previous = captured;
        
        do {
          calculated += (captured % base) * reminders[idx];
          captured /= base;
          
          ++idx;
          if(idx==6) {
            idx = 0;
          }
        } while (captured);
        
        captured = calculated;
        
      }
      
      return calculated;
    };
    
};
