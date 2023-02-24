import { Component, Input, OnChanges, OnInit, SimpleChanges } from '@angular/core';
import { ChartConfiguration, ChartDataset } from 'chart.js';

@Component({
  selector: 'app-chart',
  templateUrl: './chart.component.html',
  styleUrls: ['./chart.component.scss']
})
export class ChartComponent implements OnInit, OnChanges {
  @Input() dataset: ChartDataset<"bar", number[]>[] = []

  public chartColors: any[] = [{ 
    backgroundColor:["#f7bc00"] 
  }];

  public barChartLegend = true;
  public barChartPlugins = [];

  public barChartData: ChartConfiguration<'bar'>['data'] = {
    labels: new Array(23).fill(null).map((_, i) => i),
    datasets: this.dataset
  };

  public barChartOptions: ChartConfiguration<'bar'>['options'] = {
    responsive: false,
  };

  constructor() { }

  ngOnChanges(_: SimpleChanges): void {
    console.log(this.dataset)
    this.barChartData = {
      labels: new Array(23).fill(null).map((_, i) => i),
      datasets: this.dataset
    };
  }

  ngOnInit(): void {
    this.barChartData = {
      labels: new Array(23).fill(null).map((_, i) => i),
      datasets: this.dataset
    };
  }
}


