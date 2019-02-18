Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp1962786ywa;
        Mon, 18 Feb 2019 00:03:33 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZ7PROPKVU0WvJln9yK74Icy1FuYBOpIcAGhNPmUMBh2iSZ8ntr6tcU0tip7rGsX257yBhh
X-Received: by 2002:a65:6658:: with SMTP id z24mr21665097pgv.189.1550477013365;
        Mon, 18 Feb 2019 00:03:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550477013; cv=none;
        d=google.com; s=arc-20160816;
        b=FQgPukA5rChVYOZN9T2H7GcyfekOOg0V5Z4xenv1/083FK/XM/oYI0F7KL38Db8rnA
         OvkspzbRLknK/0q/jg48EKJ7ghQgfZWcqGmLul7efsU1GaFYVTSUVBk56UiqeHjNidHg
         KtxY4S8/weCRNd1kigljLARyrYd3GLqiqeBgEe6h09BPStOulz0GlhnZHjE3cEhf6YBI
         UejkhZmPRVslT0v95PnkuqH+IkhUeCm6Q+CQeUme0EdoRvQrYpIwzB1BPJOdcT8klu5K
         Jy3z679R04F4OnX/EX9/FAR2/bk1Ydh1FFxS5ucN4/tMtlu9UyFbuI2tzAP+Du7s8DeN
         0uaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=RX7YS1ucDegRoiBysouQcN40uF7OxZuYiHnd6rI1NJk=;
        b=obthqx2acQh8YAVURS8JCK5bVPOpm2WSfcmYq+LldTI0/PZ5VNQkamaeja12QPP+ZC
         i2lNm+huE2UmNKNxSU7vSDxweWcBfOGjQPcwH40tBc7BUJuMdjHeU+oyQylUjQuZgT3S
         UcmhmScU+zbj5CcTIbnCpFMOpUNlEHdrcA1Hz2jVW7iah1LGxNIU273KgQpyNMbLO2+1
         DnVsaQtq8swFMe0YCIPG89yhSXTnNZiGmgs4UmAOAJxs85x12rM73OyElPwR/40xZoVC
         YuiqNeGfpj+GAldpoUE7VoMK7XGfQdMTu+R3YL3P6/NpLOgW9qP2hCzUbnKId+n7eOgj
         Ww1w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id l8si10423329plt.88.2019.02.18.00.03.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 00:03:33 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82BBE8915F;
	Mon, 18 Feb 2019 08:03:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE548915F
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 18 Feb 2019 08:03:31 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2019 00:03:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,383,1544515200"; 
 d="asc'?scan'208";a="300544041"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga005.jf.intel.com with ESMTP; 18 Feb 2019 00:03:30 -0800
Date: Mon, 18 Feb 2019 15:54:01 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Zhao Yakui <yakui.zhao@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gvt: Refine the snapshort range of I915
 MCHBAR to optimize gvt-g boot time
Message-ID: <20190218075401.GO12380@zhen-hp.sh.intel.com>
References: <1550135357-30932-1-git-send-email-yakui.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <1550135357-30932-1-git-send-email-yakui.zhao@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1589756279=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1589756279==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KDy5+/kaQUC2a3Gw"
Content-Disposition: inline


--KDy5+/kaQUC2a3Gw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.02.14 17:09:16 +0800, Zhao Yakui wrote:
> Currently it will take the snapshot of the MCHBAR registers for gvt-g
> initialization so that it can be used for guest vgpu. And it will cover
> from 0x140000 to 0x17ffff. In fact based on the HW spec most of them are
> meanlingless and some time is wasted to read these register.
> Only the range of 0x144000 to 0x147fff contains the valid definition.
> So the range of capturing I915 MCHBAR register is refined, which helps
> to optimize the gvt-g boot time.
>=20
> Signed-off-by: Zhao Yakui <yakui.zhao@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/handlers.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/handlers.c b/drivers/gpu/drm/i915/g=
vt/handlers.c
> index bc64b81..0877678 100644
> --- a/drivers/gpu/drm/i915/gvt/handlers.c
> +++ b/drivers/gpu/drm/i915/gvt/handlers.c
> @@ -47,6 +47,8 @@
>  #define PCH_PP_OFF_DELAYS _MMIO(0xc720c)
>  #define PCH_PP_DIVISOR _MMIO(0xc7210)
> =20
> +#define MCHBAR_MEM_BASE		_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x4000)
> +

Pls move this to reg.h which we include all GVT specific define (yeah, I
know those PCH define looks odd, need to clean it up anyway).

>  unsigned long intel_gvt_get_device_type(struct intel_gvt *gvt)
>  {
>  	if (IS_BROADWELL(gvt->dev_priv))
> @@ -3265,7 +3267,7 @@ void intel_gvt_clean_mmio_info(struct intel_gvt *gv=
t)
>  /* Special MMIO blocks. */
>  static struct gvt_mmio_block mmio_blocks[] =3D {
>  	{D_SKL_PLUS, _MMIO(CSR_MMIO_START_RANGE), 0x3000, NULL, NULL},
> -	{D_ALL, _MMIO(MCHBAR_MIRROR_BASE_SNB), 0x40000, NULL, NULL},
> +	{D_ALL, MCHBAR_MEM_BASE, 0x4000, NULL, NULL},
>  	{D_ALL, _MMIO(VGT_PVINFO_PAGE), VGT_PVINFO_SIZE,
>  		pvinfo_mmio_read, pvinfo_mmio_write},
>  	{D_ALL, LGC_PALETTE(PIPE_A, 0), 1024, NULL, NULL},
> --=20

I think that's fine, as for recent HW guest drivers shouldn't depend on
anything in head range of MCHBAR.

Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--KDy5+/kaQUC2a3Gw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXGpkmQAKCRCxBBozTXgY
J+TWAJ9hbYoWbuyp6qiWA1UgLKbwn9qCsgCgkE1B/j1ftEC8B659JmJTKyAXtUg=
=hi4e
-----END PGP SIGNATURE-----

--KDy5+/kaQUC2a3Gw--

--===============1589756279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1589756279==--
