module ProjectsHelper
  def render_project(project)
    data = project.code.split("\n")
    found = false
    data.each_with_index do |instr, index|
      if instr.include? 'function setup()'
        found = true
        data.insert(index + 1, "\tcanvas.parent('sketch-holder');")
        data.insert(
          index + 1,
          "\tlet canvas = createCanvas(REAL_CANVAS_S, REAL_CANVAS_S);"
        )
        break
      end
    end
    unless found
      setup = [
        'function setup() {',
        "\tlet canvas = createCanvas(REAL_CANVAS_S, REAL_CANVAS_S);",
        "\tcanvas.parent('sketch-holder');",
        '}'
      ]
      data = setup + data
    end
    size = 'let REAL_CANVAS_S = ' \
      'document.getElementById("sketch-holder").offsetWidth > 1200 ' \
      '? document.getElementById("sketch-holder").offsetWidth * 0.6 ' \
      ': document.getElementById("sketch-holder").offsetWidth;'
    sizer = [size, 'let size = REAL_CANVAS_S;']
    data = sizer + data
    data.join("\n").html_safe
  end
end
