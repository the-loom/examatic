html_lorem_ipsum = <<-HTML
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque hendrerit, odio at pellentesque sollicitudin, augue ipsum fringilla libero, efficitur consectetur mauris lectus tincidunt tellus.</p>
  <p>Aliquam magna risus, pharetra ac congue a, tempus maximus libero. Fusce eleifend mauris justo, a molestie sem eleifend ac. Ut finibus iaculis rhoncus. Etiam consectetur imperdiet laoreet. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce hendrerit risus nec ligula ultrices, sit amet pulvinar enim vulputate.</p>
  <p>Sed scelerisque elementum finibus. Morbi lacinia tempor massa, laoreet dapibus turpis blandit in. Integer et elementum mauris. Fusce non suscipit dolor. Curabitur in diam porttitor, cursus felis gravida, mollis odio. Morbi rhoncus, ante id laoreet maximus, nulla massa iaculis dolor, quis ultrices nisl mauris ac diam. Cras ante risus, gravida sed vestibulum et, consectetur sed erat.</p>
HTML

tags = %w(uno dos tres cuatro cinco seis)

10.times do |index|
  Exercise.create(
      wording: html_lorem_ipsum,
      solution: html_lorem_ipsum,
      difficulty: (index % 3) + 1,
      tag_list: tags.shuffle[0..2]
    )
end

Exam.create(
    title: "Primer parcial",
    exam_date: Time.now.to_date,
    exercises: [Exercise.first, Exercise.second, Exercise.third]
  )
