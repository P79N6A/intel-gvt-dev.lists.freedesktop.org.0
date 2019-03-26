Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp4347054ywb;
        Mon, 25 Mar 2019 20:43:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqydqMfIwqrjjVubL4R1GX/ti5MNU/PIVzqDsFk3g13Oi+qJAkU/mhCjX1zmmblBAvGXJpQi
X-Received: by 2002:a62:bd09:: with SMTP id a9mr27341609pff.61.1553571793875;
        Mon, 25 Mar 2019 20:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553571793; cv=none;
        d=google.com; s=arc-20160816;
        b=yToJ+O34HT6TZ0rWE1nvwza5cKndl0AwZn8ajzA862XcJ/hr8IVJ9tWLhBpZaiBBhZ
         eBYdd3864GERaczu/6FegfEqVHDzaKoTCGa0GKyEkR8s59Vtfg4tgPfSX0TmNoUe7jN8
         gxAgqfxFEBYPLZYqZd4736EwgsqHmI+NMHW6VVOcCJnKAqsPdiAyuxWj5AqTqyE3Rq2k
         yjQNQI76zzixO5UWQoHU2QTRF0vr2GEGzb07WGzQG13LtqGUbVU9otAlLWjNYw8eZl0I
         jde0MuUNhzhv/ykKDP+HjVc4AxXVaKnRLz3+IWW+0Pp6KIhedhbUskG1qgzsejpi/WTy
         GLZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=uEfLzSp4521dfIZQVEC46uvX0LKeweEoGL88ID6+HZs=;
        b=vtoHINp5rIzbTakr7hA8ypcPvrSinDR/PyDJqJApVSbciuDMUiSGgyZ6iV9h0V+wgo
         sVgjRUqTOU5YoAnzIZ4hlaoZshyShUqF4lReRZqU0gmSIZXvrfKryLvX3Ly2YX9KVD4b
         5lOF/GPiMGiHQHOeGVHcEjTTwYwq9et5lHMIDSjUSDJ9cQAv8zNs1j16z3RvNWkfO/jK
         RtQ0DaiCiMBralCtgJQz5StZMA+w9OZMLx0uDk3UK8phSDRbGUHrYK0mD9rviUtSOd0P
         +10tquDnfp2vn+G67Do/mg4GJ0dMji+XUmaiH0hbghoVcHqKyleoPnEFBFEJlyQgxKDe
         9LPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id x6si14512055pfm.219.2019.03.25.20.43.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2019 20:43:13 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EE96E76C;
	Tue, 26 Mar 2019 03:43:12 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0D66E76C
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 26 Mar 2019 03:43:12 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Mar 2019 20:43:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,271,1549958400"; 
 d="asc'?scan'208";a="143817016"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Mar 2019 20:43:10 -0700
Date: Tue, 26 Mar 2019 11:32:25 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiong Zhang <xiong.y.zhang@intel.com>
Subject: Re: [PATCH v2 2/2] drm/i915/gvt: Change fb_info->size from pages to
 bytes
Message-ID: <20190326033225.GD10798@zhen-hp.sh.intel.com>
References: <20190321075254.GG10798@zhen-hp.sh.intel.com>
 <1553502560-3796-1-git-send-email-xiong.y.zhang@intel.com>
 <1553502560-3796-2-git-send-email-xiong.y.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <1553502560-3796-2-git-send-email-xiong.y.zhang@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-BeenThere: intel-gvt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: "Intel GVT \(Graphics Virtualization\) development list"
 <intel-gvt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gvt-dev>
List-Post: <mailto:intel-gvt-dev@lists.freedesktop.org>
List-Help: <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev>, 
 <mailto:intel-gvt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0502134123=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0502134123==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GuCODRLlE2VjZS/b"
Content-Disposition: inline


--GuCODRLlE2VjZS/b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.25 16:29:20 +0800, Xiong Zhang wrote:
> fb_info->size is in pages, but some function need bytes when it
> is a parameter. Such as:
> a. intel_gvt_ggtt_validate_range() according to function definition
> b. vfio_device_gfx_plane_info->size according to the comment of
>    its definition
>=20
> This patch change fb_info->size into bytes.
>=20
> v2: Keep fb_info->size in real size instead of assigning casted
>     page size(zhenyu)
>=20
> Signed-off-by: Xiong Zhang <xiong.y.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/dmabuf.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/dmabuf.c b/drivers/gpu/drm/i915/gvt=
/dmabuf.c
> index 5d887f7..4855b1a 100644
> --- a/drivers/gpu/drm/i915/gvt/dmabuf.c
> +++ b/drivers/gpu/drm/i915/gvt/dmabuf.c
> @@ -45,6 +45,7 @@ static int vgpu_gem_get_pages(
>  	int i, ret;
>  	gen8_pte_t __iomem *gtt_entries;
>  	struct intel_vgpu_fb_info *fb_info;
> +	u32 page_num;
> =20
>  	fb_info =3D (struct intel_vgpu_fb_info *)obj->gvt_info;
>  	if (WARN_ON(!fb_info))
> @@ -54,14 +55,15 @@ static int vgpu_gem_get_pages(
>  	if (unlikely(!st))
>  		return -ENOMEM;
> =20
> -	ret =3D sg_alloc_table(st, fb_info->size, GFP_KERNEL);
> +	page_num =3D (fb_info->size + PAGE_SIZE - 1) >> PAGE_SHIFT;

Don't check for fb_info->size, but just obj->size / PAGE_SIZE for page coun=
t.

> +	ret =3D sg_alloc_table(st, page_num, GFP_KERNEL);
>  	if (ret) {
>  		kfree(st);
>  		return ret;
>  	}
>  	gtt_entries =3D (gen8_pte_t __iomem *)dev_priv->ggtt.gsm +
>  		(fb_info->start >> PAGE_SHIFT);
> -	for_each_sg(st->sgl, sg, fb_info->size, i) {
> +	for_each_sg(st->sgl, sg, page_num, i) {
>  		sg->offset =3D 0;
>  		sg->length =3D PAGE_SIZE;
>  		sg_dma_address(sg) =3D
> @@ -157,8 +159,7 @@ static struct drm_i915_gem_object *vgpu_create_gem(st=
ruct drm_device *dev,
>  	if (obj =3D=3D NULL)
>  		return NULL;
> =20
> -	drm_gem_private_object_init(dev, &obj->base,
> -		info->size << PAGE_SHIFT);
> +	drm_gem_private_object_init(dev, &obj->base, info->size);

Here needs to round to page size by roundup(info->size, PAGE_SIZE),
otherwise i915 would complain.

>  	i915_gem_object_init(obj, &intel_vgpu_gem_ops);
> =20
>  	obj->read_domains =3D I915_GEM_DOMAIN_GTT;
> @@ -210,6 +211,7 @@ static int vgpu_get_plane_info(struct drm_device *dev,
>  	struct intel_vgpu_primary_plane_format p;
>  	struct intel_vgpu_cursor_plane_format c;
>  	int ret;
> +	u32 page_num;
> =20
>  	if (plane_id =3D=3D DRM_PLANE_TYPE_PRIMARY) {
>  		ret =3D intel_vgpu_decode_primary_plane(vgpu, &p);
> @@ -264,8 +266,9 @@ static int vgpu_get_plane_info(struct drm_device *dev,
>  		return -EINVAL;
>  	}
> =20
> -	info->size =3D (info->stride * info->height + PAGE_SIZE - 1)
> -		      >> PAGE_SHIFT;
> +	// align to page

comment style

> +	info->size =3D info->stride * info->height;
> +	page_num =3D (info->size + PAGE_SIZE - 1) >> PAGE_SHIFT;
>  	if (info->size =3D=3D 0) {
>  		gvt_vgpu_err("fb size is zero\n");
>  		return -EINVAL;
> @@ -275,7 +278,7 @@ static int vgpu_get_plane_info(struct drm_device *dev,
>  		gvt_vgpu_err("Not aligned fb address:0x%llx\n", info->start);
>  		return -EFAULT;
>  	}
> -	if (((info->start >> PAGE_SHIFT) + info->size) >
> +	if (((info->start >> PAGE_SHIFT) + page_num) >
>  		ggtt_total_entries(&dev_priv->ggtt)) {
>  		gvt_vgpu_err("Invalid GTT offset or size\n");
>  		return -EFAULT;
> --

Is this check necessary? later ggtt validate range check should cover us, r=
ight?

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--GuCODRLlE2VjZS/b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXJmdSQAKCRCxBBozTXgY
J26FAJ4uo649HOyuMbyCfs23miraxL4szgCgg9cEhYnJI4FRVih2+/v1HsXNDzM=
=ryT5
-----END PGP SIGNATURE-----

--GuCODRLlE2VjZS/b--

--===============0502134123==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0502134123==--
