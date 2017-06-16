//
//  ViewController.m
//  MyCamera
//
//  Created by Maokebing 4/21/16.
//  Copyright © 2016 mao. All rights reserved.
//

#import "ViewController.h"
#import "MISImagePickerController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* table;
@property (nonatomic, strong) UIImageView* headerImageView;
@end

@implementation ViewController


#pragma makr - LifeCycle

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.title = @"MISImagePicker";
	
	[self.view addSubview:self.table];
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	//Test image show
	self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
	self.headerImageView.contentMode = UIViewContentModeScaleAspectFit;
	
	self.table.tableHeaderView = self.headerImageView;
    
//    MISImagePicker
//    
//    一个封装后图片选择器，省去了调用官方复杂的api, 调用方便简单, 可定制来源和缩放等属性，通过 Block 返回处理后的图片。
//    
//    选择器类型
//    
//    系统相册
//    多选相册
//    打开相机
//    打开相机裁剪
//    录制MP4视频
//    打开系统相册
//    
//    eg.
//    MISImagePickerController* controller = [[MISImagePickerController alloc] init];
//    controller.sourceType = MISImagePickerSorceTypeAlbums;
//    controller.selectedFinishBlock = ^(NSArray* images) {
//        NSLog(@"%@", images);
//    };
//    
//    [controller presentImagePickerInViewController:self];
//    打开多选相册
//    
//    eg.
//    MISImagePickerController* controller = [[MISImagePickerController alloc] init];
//    controller.sourceType = MISImagePickerSorceTypeMulti;
//    controller.selectedFinishBlock = ^(NSArray* images) {
//        NSLog(@"%@", images);
//    };
//    
//    [controller presentImagePickerInViewController:self];
//    打开相机
//    
//    eg.
//    MISImagePickerController* controller = [[MISImagePickerController alloc] init];
//    controller.sourceType = MISImagePickerSorceTypeCamera;
//    controller.selectedFinishBlock = ^(NSArray* images) {
//        NSLog(@"%@", images);
//    };
//    
//    [controller presentImagePickerInViewController:self];
//    打开横向相机并裁剪
//    
//    eg.
//    MISImagePickerController* controller = [[MISImagePickerController alloc] init];
//    controller.sourceType = MISImagePickerSorceTypeCustomHorizontalCamera;
//    controller.selectedFinishBlock = ^(NSArray* images) {
//        NSLog(@"%@", images);
//    };
//    
//    [controller presentImagePickerInViewController:self];
//    录制MP4视频
//    
//    MISImagePickerController* controller = [[MISImagePickerController alloc] init];
//    controller.sourceType = MISImagePickerSorceTypeVideo;
//    controller.pickVideoFinishBlock = ^(NSString* filePath, NSInteger fileSize, UIImage* thumbnail, NSInteger duration) {
//        NSLog(@"filePath:%@, fileSize:%@, thumbnail:%@, duration:%@", filePath, @(fileSize), thumbnail, @(duration));
//    };
//    [controller presentImagePickerInViewController:self];
//    属性说明
//    
//    /**
//     *  最多可选(MISImagePickerSorceTypeMulti 时有效) 默认9张
//     */
//    @property (nonatomic) NSInteger maxImageCount;
//    
//    /**
//     *  允许编辑-（MISImagePickerSorceTypeMulti 时无效）默认为NO
//     */
//    @property (nonatomic) BOOL allowsEditing;
//    
//    /**
//     *  相册库类型 -默认为: MISImagePickerSorceTypeMulti
//     */
//    @property (nonatomic) MISImagePickerSorceType sourceType;
//    
//    
//    /**
//     *  缩放图片最大尺寸- 默认为 屏幕高宽 eg. iPhone 5s CGSize(640, 1136)
//     */
//    @property (nonatomic) CGSize scaleAspectFitSize;
//    
//    
//    /**
//     *  缩放图片最小尺寸- 默认为 CGSize(150, 150)
//     */
//    @property (nonatomic) CGSize minScaleAspectFillSize;
//    
//    /**
//     *  缩放图片比例- 默认为 0.0f, 如果设定，则scaleAspectFitSize无效
//     */
//    @property (nonatomic) CGFloat scale;
//    
//    
//    /**
//     *  视频录制最大时长 单位:秒 默认为:60秒
//     */
//    @property (nonatomic) NSInteger videoMaximumDuration;
//    let's enjoy it.
}




#pragma mark - Fuctions

/**
 *  单选相册
 */
- (void)openAlbum {
	MISImagePickerController* controller = [[MISImagePickerController alloc] init];
	controller.sourceType = MISImagePickerSorceTypeAlbums;
	controller.scaleAspectFitSize = CGSizeMake(1280, 1280);
	controller.selectedFinishBlock = ^(NSArray* images) {
		NSLog(@"%@", images);
	};
	
	[controller presentImagePickerInViewController:self];
}


/**
 *  多选相册
 */
- (void)openMutiAlbum {
	MISImagePickerController* controller = [[MISImagePickerController alloc] init];
	controller.sourceType = MISImagePickerSorceTypeMulti;
	controller.selectedFinishBlock = ^(NSArray* images) {
		NSLog(@"%@", images);
	};
	
	[controller presentImagePickerInViewController:self];
}

/**
 *  打开相机
 */
- (void)openCamera {
	MISImagePickerController* controller = [[MISImagePickerController alloc] init];
	controller.sourceType = MISImagePickerSorceTypeCamera;
	controller.selectedFinishBlock = ^(NSArray* images) {
		NSLog(@"%@", images);
	};
	
	[controller presentImagePickerInViewController:self];
}

/**
 *  打开相机-拍照答题
 */
- (void)openCropCamera {
	MISImagePickerController* controller = [[MISImagePickerController alloc] init];
	controller.sourceType = MISImagePickerSorceTypeCustomHorizontalCamera;
	controller.cropFinishBlock = ^(UIImage* image) {
		NSLog(@"%@", image);
		self.headerImageView.image = image;
	};
	
	[controller presentImagePickerInViewController:self];
}

/**
 *  录 mp4
 */
- (void)openCameraForMp4 {
	MISImagePickerController* controller = [[MISImagePickerController alloc] init];
	controller.sourceType = MISImagePickerSorceTypeVideo;
	controller.pickVideoFinishBlock = ^(NSString* filePath, NSInteger fileSize, UIImage* thumbnail, NSInteger duration) {
		NSLog(@"filePath:%@, fileSize:%@, thumbnail:%@, duration:%@", filePath, @(fileSize), thumbnail, @(duration));
	};
	[controller presentImagePickerInViewController:self];
}


/**
 *  录 mp4
 */
- (void)openAlbumVideo {
	MISImagePickerController* controller = [[MISImagePickerController alloc] init];
	controller.sourceType = MISImagePickerSorceTypeAlbumVideo;
	controller.pickVideoFinishBlock = ^(NSString* filePath, NSInteger fileSize, UIImage* thumbnail, NSInteger duration) {
		NSLog(@"filePath:%@, fileSize:%@, thumbnail:%@, duration:%@", filePath, @(fileSize), thumbnail, @(duration));
	};
	[controller presentImagePickerInViewController:self];
}




#pragma makr - UITableViewDataSource & UITableViewDelegate


- (UITableView *)table {
	if (!_table) {
		_table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStyleGrouped];
		_table.delegate  = self;
		_table.dataSource = self;
		_table.rowHeight  = 44.0f;
		[_table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
	}
	return _table;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
	switch (indexPath.row) {
		case 0:
			cell.textLabel.text = @"系统相册";
			break;
		case 1:
			cell.textLabel.text = @"多选相册";
			break;
		case 2:
			cell.textLabel.text = @"打开相机";
			break;
		case 3:
			cell.textLabel.text = @"拍照裁切";
			break;
		case 4:
			cell.textLabel.text = @"录制MP4";
			break;
		case 5:
			cell.textLabel.text = @"选择MP4";
			break;
  default:
			break;
	}
	
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	switch (indexPath.row) {
		case 0:
			[self openAlbum];
			break;
		case 1:
			[self openMutiAlbum];
			break;
		case 2:
			[self openCamera];
			break;
		case 3:
			[self openCropCamera];
			break;
		case 4:
			[self openCameraForMp4];
			break;
		case 5:
			[self openAlbumVideo];
			break;
  default:
			break;
	}
}

@end
