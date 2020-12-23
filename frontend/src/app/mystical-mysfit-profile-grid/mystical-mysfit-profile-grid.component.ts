import { Component, OnInit } from '@angular/core';
import { MythicalMysfitProfile } from '../models/mythical-mysfit-profile';
import { MythicalMysfitResponse } from '../models/mythical-mysfit-response';
import { MythicalMysfitProfileService } from '../services/mythical-mysfit-profile.service';

@Component({
  selector: 'mm-mystical-mysfit-profile-grid',
  templateUrl: './mystical-mysfit-profile-grid.component.html',
  styleUrls: ['./mystical-mysfit-profile-grid.component.css'],
})
export class MysticalMysfitProfileGridComponent implements OnInit {
  mysfits: MythicalMysfitProfile[] = [];
  constructor(private mysfitService: MythicalMysfitProfileService) {}

  ngOnInit(): void {
    this.mysfitService
      .retrieveMysfitProfiles()
      .subscribe(
        (myfitResponse: MythicalMysfitResponse) =>
          (this.mysfits = myfitResponse.mysfits),
      );
  }
}
