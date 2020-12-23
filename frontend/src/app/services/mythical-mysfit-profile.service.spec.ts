import { TestBed } from '@angular/core/testing';

import { MythicalMysfitProfileService } from './mythical-mysfit-profile.service';

describe('MythicalMysfitProfileService', () => {
  let service: MythicalMysfitProfileService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(MythicalMysfitProfileService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
