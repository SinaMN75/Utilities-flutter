import "package:u/utilities.dart";

class UAdminUserCreateUpdateArgs {
  final UUserResponse? user;

  UAdminUserCreateUpdateArgs({this.user});
}

class UAdminUserCreateUpdateController {
  late UAdminUserCreateUpdateArgs args;

  late TextEditingController controllerFirstName;
  late TextEditingController controllerLastName;
  late TextEditingController controllerUserName;
  late TextEditingController controllerBirthDate;
  late TextEditingController controllerPassword;
  late TextEditingController controllerEmail;
  late TextEditingController controllerPhoneNumber;
  late TextEditingController controllerFatherName;
  late List<FileData> files;
  late Rx<TagUser> gender = TagUser.female.obs;
  late Rx<TagUser> role = TagUser.guest.obs;
  late DateTime birthdate;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void init({required final UAdminUserCreateUpdateArgs args}) {
    this.args = args;
    controllerFirstName = TextEditingController(text: args.user?.firstName);
    controllerLastName = TextEditingController(text: args.user?.lastName);
    controllerUserName = TextEditingController(text: args.user?.userName);
    controllerBirthDate = TextEditingController(text: args.user?.birthdate?.toJalaliDate());
    controllerPassword = TextEditingController(text: args.user?.password);
    controllerEmail = TextEditingController(text: args.user?.email);
    controllerPhoneNumber = TextEditingController(text: args.user?.phoneNumber);
    controllerFatherName = TextEditingController(text: args.user?.jsonData.fatherName);
    files = (args.user?.media ?? <UMediaResponse>[]).map((UMediaResponse media) => FileData(url: media.url)).toList();
    gender((args.user?.tags.isMale() ?? false) ? TagUser.male : TagUser.female);
    role((args.user?.tags.isSuperAdmin() ?? false) ? TagUser.superAdmin : TagUser.guest);
    birthdate = args.user?.birthdate ?? DateTime.now().toUtc();
  }

  void create({
    required GlobalKey<FormState> formKey,
    required UUserCreateParams p,
    List<FileData>? files,
  }) => UValidators.validateForm(
    key: formKey,
    action: () {
      ULoading.show();
      U.services.user.create(
        p: p,
        onOk: (final UResponse<UUserResponse> r) async {
          files?.forEach(
            (FileData i) async => U.services.media.create(
              p: UMediaCreateParams(file: i, userId: r.result!.id, tag1: TagMedia.image.number),
              onOk: (UResponse<UMediaResponse> r) {},
              onError: (UResponse<dynamic> r) {},
              onException: (String r) {},
            ),
          );
          ULoading.dismiss();
          UNavigator.back();
          UToast.snackBar(message: U.s.userCreatedSuccessfully);
        },
        onError: (final UResponse<dynamic> r) {
          ULoading.dismiss();
          UToast.snackBar(message: r.message);
        },
        onException: (String e) {
          ULoading.dismiss();
          UToast.snackBar(message: e);
        },
      );
    },
  );

  void update({
    required final GlobalKey<FormState> formKey,
    required final UUserUpdateParams p,
    List<FileData>? files,
  }) => UValidators.validateForm(
    key: formKey,
    action: () {
      ULoading.show();
      files?.forEach(
        (FileData i) async => U.services.media.create(
          p: UMediaCreateParams(file: i, userId: p.id, tag1: TagMedia.image.number),
          onOk: (UResponse<UMediaResponse> r) {},
          onError: (UResponse<dynamic> r) {},
          onException: (String r) {},
        ),
      );
      U.services.user.update(
        p: p,
        onOk: (final UResponse<UUserResponse> r) {
          ULoading.dismiss();
          UNavigator.back();
          UToast.snackBar(message: "User created successfully");
        },
        onError: (final UResponse<dynamic> r) {
          ULoading.dismiss();
          UToast.snackBar(message: r.message);
        },
        onException: (String e) {
          ULoading.dismiss();
          UToast.snackBar(message: e);
        },
      );
    },
  );
}
