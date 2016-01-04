<<NOTE.!
  Problem 18 Maximum path sum I

  By starting at the top of the triangle below and moving to adjacent numbers on the row below,
  the maximum total from top to bottom is 23.

       3
      7 4
     2 4 6
    8 5 9 3

  That is, 3 + 7 + 4 + 9 = 23.

  Find the maximum total from top to bottom of the triangle below:

                              75
                            95  64
                          17  47  82
                        18  35  87  10
                      20  04  82  47  65
                    19  01  23  75  03  34
                  88  02  77  73  07  63  67
                99  65  04  28  06  16  70  92
              41  41  26  56  83  40  80  70  33
            41  48  72  33  47  32  37  16  94  29
          53  71  44  65  25  43  91  52  97  51  14
        70  11  33  28  77  73  17  78  39  68  17  57
      91  71  52  38  17  14  91  43  58  50  27  29  48
    63  66  04  68  89  53  67  30  73  16  69  87  40  31
  04  62  98  27  23  09  70  98  73  93  38  53  60  04  23

  NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route.
  However, Problem 67, is the same challenge with a triangle containing one-hundred rows;
  it cannot be solved by brute force, and requires a clever method! ;o)
NOTE

class Node
  attr_reader :id, :value, :position, :links

  def initialize(id, val)
    @id       = id
    @value    = val
    @position = :leaf
    @links    = []
  end

  def <<(nodes)
    @position = :branch
    @links.concat [*nodes]
  end

  def prune!
    if links.size > 0 && links.all?(&:leaf?)
      @value += links.max_by(&:value).value
      @links = []
      @position = :leaf
    end
  end

  def branch?
    position == :branch
  end

  def leaf?
    @position = :leaf if links.size < 2
  end
end

id = 0
node_list = []
before_set = []

DATA.each_line.with_index do |line, index|
  nodes = line.split(/\s+/).map(&:to_i).map do |val|
    id += 1
    node = Node.new(id, val)
    node_list << node
    node
  end

  nodes.each_cons(2).with_index do |arr, idx|
    if before_set.size > 0
      before_set[idx] << arr
    end
  end

  before_set = nodes
end

while node_list[0].branch? do
  node_list.each(&:prune!)
end

puts "A. #{node_list[0].value}"



__END__
75
95  64
17  47  82
18  35  87  10
20  04  82  47  65
19  01  23  75  03  34
88  02  77  73  07  63  67
99  65  04  28  06  16  70  92
41  41  26  56  83  40  80  70  33
41  48  72  33  47  32  37  16  94  29
53  71  44  65  25  43  91  52  97  51  14
70  11  33  28  77  73  17  78  39  68  17  57
91  71  52  38  17  14  91  43  58  50  27  29  48
63  66  04  68  89  53  67  30  73  16  69  87  40  31
04  62  98  27  23  09  70  98  73  93  38  53  60  04  23
