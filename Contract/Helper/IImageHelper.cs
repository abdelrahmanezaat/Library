namespace Library.Contract.Helper
{
    public interface IImageHelper
    {
        Task<string?> UploadImageAsync(IFormFile? file, string folderName);
    }
}
