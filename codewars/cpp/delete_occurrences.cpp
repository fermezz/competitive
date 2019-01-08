// Solution for https://www.codewars.com/kata/554ca54ffa7d91b236000023


std::vector<int> deleteNth(std::vector<int> arr, int n)
{
  std::vector<int> result = {};

  for(int a : arr) {
  
    int occurrences_a = std::count (result.begin(), result.end(), a);
    
    if(occurrences_a < n) {
      result.push_back(a);
    }
  
  }

  return result;
}
