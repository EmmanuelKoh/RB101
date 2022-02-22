hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}
arr = hsh.each_with_object([]) do |(_, value), array|
  color_array = []
  if value[:type] == 'fruit'
    color_array = value[:colors].map {|string| string.capitalize}
    array << color_array
  else
    array << value[:size].upcase
  end
end

p arr