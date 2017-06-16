# MISImagePicker
一个封装后图片选择器，省去了调用官方复杂的api, 调用方便简单, 可定制来源和缩放等属性，通过 Block 返回处理后的图片。

### 选择器类型
* 系统相册
* 多选相册
* 打开相机
* 打开相机裁剪
* 录制MP4视频


### 打开系统相册

```
eg.
MISImagePickerController* controller = [[MISImagePickerController alloc] init];
controller.sourceType = MISImagePickerSorceTypeAlbums;
controller.selectedFinishBlock = ^(NSArray* images) {
	NSLog(@"%@", images);
};
	
[controller presentImagePickerInViewController:self];
```
### 打开多选相册
```
eg.
MISImagePickerController* controller = [[MISImagePickerController alloc] init];
controller.sourceType = MISImagePickerSorceTypeMulti;
controller.selectedFinishBlock = ^(NSArray* images) {
	NSLog(@"%@", images);
};
	
[controller presentImagePickerInViewController:self];
```

### 打开相机

```
eg.
MISImagePickerController* controller = [[MISImagePickerController alloc] init];
controller.sourceType = MISImagePickerSorceTypeCamera;
controller.selectedFinishBlock = ^(NSArray* images) {
	NSLog(@"%@", images);
};
	
[controller presentImagePickerInViewController:self];
```

### 打开横向相机并裁剪

```
eg.
MISImagePickerController* controller = [[MISImagePickerController alloc] init];
controller.sourceType = MISImagePickerSorceTypeCustomHorizontalCamera;
controller.selectedFinishBlock = ^(NSArray* images) {
	NSLog(@"%@", images);
};
	
[controller presentImagePickerInViewController:self];
```

### 录制MP4视频

```
MISImagePickerController* controller = [[MISImagePickerController alloc] init];
controller.sourceType = MISImagePickerSorceTypeVideo;
controller.pickVideoFinishBlock = ^(NSString* filePath, NSInteger fileSize, UIImage* thumbnail, NSInteger duration) {
	NSLog(@"filePath:%@, fileSize:%@, thumbnail:%@, duration:%@", filePath, @(fileSize), thumbnail, @(duration));
};
[controller presentImagePickerInViewController:self];
```

### 属性说明

```
/**
 *  最多可选(MISImagePickerSorceTypeMulti 时有效) 默认9张
 */
@property (nonatomic) NSInteger maxImageCount;

/**
 *  允许编辑-（MISImagePickerSorceTypeMulti 时无效）默认为NO
 */
@property (nonatomic) BOOL allowsEditing;

/**
 *  相册库类型 -默认为: MISImagePickerSorceTypeMulti
 */
@property (nonatomic) MISImagePickerSorceType sourceType;


/**
 *  缩放图片最大尺寸- 默认为 屏幕高宽 eg. iPhone 5s CGSize(640, 1136)
 */
@property (nonatomic) CGSize scaleAspectFitSize;


/**
 *  缩放图片最小尺寸- 默认为 CGSize(150, 150)
 */
@property (nonatomic) CGSize minScaleAspectFillSize;

/**
 *  缩放图片比例- 默认为 0.0f, 如果设定，则scaleAspectFitSize无效
 */
@property (nonatomic) CGFloat scale;


/**
 *  视频录制最大时长 单位:秒 默认为:60秒
 */
@property (nonatomic) NSInteger videoMaximumDuration;
```

### let's enjoy it. 
