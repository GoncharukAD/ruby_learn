months = { "january" => 31, "february" => 29, "marth" => 31, "april" => 30,
"may" => 31, "june" => 30, "july" => 31, "august" => 31, "september" => 30, "october" => 31, "november" => 30,"desember" => 31}
months.each { |month, days|
 puts month if days == 30
}