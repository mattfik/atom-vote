# @cjsx React.DOM

@PollMeta = React.createClass
  displayName: 'PollMeta'

  propTypes:
    poll: React.PropTypes.object.isRequired

  componentDidMount: ->
    google.setOnLoadCallback(@drawDonutGraph)

  drawDonutGraph: ->
    data = [['Option', 'Votes']]
    for option in @props.poll.options
      data.push [option.text, option.votes_count]

    data = google.visualization.arrayToDataTable(data)

    options =
      title:    'My Daily Activities'
      pieHole:  0.2
      legend: 'none'
      backgroundColor: 'transparent'
      chartArea:
        top: 0
        height: 500

    chart = new google.visualization.PieChart(document.getElementById('poll-donut-chart'));
    chart.draw(data, options);

  renderLastVote: ->
    moment(@props.poll.updated_at, "YYYY-MM-DDTHH:mm:ss.Z").fromNow()

  render: ->
    <div className="poll-meta">
      <div className="graph">
        <div id="poll-donut-chart" />
      </div>
      <div className="stats">
        <ul>
          <li>
            <span className="data">{ @props.poll.votes_count }</span>
            <span>Total</span>
          </li>
          <li>
            <span className="data">{ @renderLastVote() }</span>
            <span>Last</span>
          </li>
        </ul>
      </div>
    </div>