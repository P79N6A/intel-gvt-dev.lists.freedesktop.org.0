Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp1155734ywe;
        Fri, 22 Feb 2019 00:18:50 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaOsLs4nv+tXg8otfO+VY6Vw2oJLYoIa9SsxyQH7NJEWHA7c7XwxduC0vjvVB0pxPE2Eyfm
X-Received: by 2002:a65:6544:: with SMTP id a4mr2840098pgw.412.1550823530256;
        Fri, 22 Feb 2019 00:18:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550823530; cv=none;
        d=google.com; s=arc-20160816;
        b=Yl8GB68o7xXAk5R4+DJTb1RZecfbXoCHWbgsECB/l8WuuOFJFYV3Qt0gCR+E6NFQt3
         hPWPpK9M3UlkRftR3Zu2OPY8DLgEvhJcpSJUm5lI7UjaH7GkkagFwwQQf4bwmK7rS5Cu
         esw52dVS1QZAo4GDWOGkLpxivz1kYpVaoxkuoqSoSk0hJ84cBvrlvOM/POq2AqaFSKde
         sRk2NNYY6xZrGR4t7H5d3DqvKbZF6ekefghvuKQU6LhYH7W9vtN8jLGxt+ZNzYzPk3j3
         k/jGGw472Wy4GGssjlifgChqZnQ21bHZ2NhBo1sx+3MdhZO6toaFPOzlnkmpthnGorWJ
         kEJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=nMOBk+V4kClJsYKgcizODyAuK/C5eecQzxrWbQDEkLA=;
        b=Ce7ArgxKQuxHsgPpxGgopjiooDsV9fiTpcevpiHcUbM7CxI5yt7nCUrJN+oD/YdMYZ
         UL98cUbWjB/gzAStq8X5YOrG/PnLujPFwKmQOmTA/DV4Pp+iWaLZrCnG2A/VMniVT44o
         T0QxCf+Fi8HAOL4IQGd9wgzzQpK8XixuYdUNMZmSvrFRAfuofNUjIXsf4CyaHqYh9qfp
         sChLFZzOJ6yewty/4IDVhFqqWC9rPPng99hYTYs3fkpsC5vlRdmyB+7VDrwVCR6lEtqt
         LtZP9xRm8aWBUzAw/zmox4TwTxKdOqMmCNhf19HTBZ/bYhmCw5FHKr8T1Za+KZX8hu8O
         XIMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id z3si872516pgr.90.2019.02.22.00.18.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Feb 2019 00:18:50 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1EF8903B;
	Fri, 22 Feb 2019 08:18:49 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D742F8903B
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Feb 2019 08:18:47 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Feb 2019 00:18:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,398,1544515200"; 
 d="asc'?scan'208";a="136323177"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga002.jf.intel.com with ESMTP; 22 Feb 2019 00:18:45 -0800
Date: Fri, 22 Feb 2019 16:09:08 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH v2] drm/i915/gvt: Add in context mmio 0x20D8 to gen9 mmio
 list
Message-ID: <20190222080908.GB12380@zhen-hp.sh.intel.com>
References: <20190222061342.21578-1-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190222061342.21578-1-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0450486955=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0450486955==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yzwzo2Lpb9tBI5S/"
Content-Disposition: inline


--Yzwzo2Lpb9tBI5S/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.02.22 14:13:42 +0800, Colin Xu wrote:
> Depends on GEN family and I915_PARAM_HAS_CONTEXT_ISOLATION, Mesa driver
> will decide whether constant buffer 0 address is relative or absolute,
> and load GPU initial state by lri to context mmio INSTPM (GEN8)
> or 0x20D8 (>=3DGEN9).
> Mesa Commit fa8a764b62
> ("i965: Use absolute addressing for constant buffer 0 on Kernel 4.16+.")
>=20
> INSTPM is already added to gen8_engine_mmio_list, but 0x20D8 is missed
> in gen9_engine_mmio_list. From GVT point of view, different guest could
> have different context so should switch those mmio accordingly.
>=20
> Fixes: 178657139307 ("drm/i915/gvt: vGPU context switch")
>=20
> v2: Update fixes commit ID.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/mmio_context.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/mmio_context.c b/drivers/gpu/drm/i9=
15/gvt/mmio_context.c
> index 7d84cfb9051a..7902fb162d09 100644
> --- a/drivers/gpu/drm/i915/gvt/mmio_context.c
> +++ b/drivers/gpu/drm/i915/gvt/mmio_context.c
> @@ -132,6 +132,7 @@ static struct engine_mmio gen9_engine_mmio_list[] __c=
acheline_aligned =3D {
> =20
>  	{RCS, GEN9_GAMT_ECO_REG_RW_IA, 0x0, false}, /* 0x4ab0 */
>  	{RCS, GEN9_CSFE_CHICKEN1_RCS, 0xffff, false}, /* 0x20d4 */
> +	{RCS, _MMIO(0x20D8), 0xffff, true}, /* 0x20d8 */
> =20
>  	{RCS, GEN8_GARBCNTL, 0x0, false}, /* 0xb004 */
>  	{RCS, GEN7_FF_THREAD_MODE, 0x0, false}, /* 0x20a0 */
> --=20

Fine for me.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--Yzwzo2Lpb9tBI5S/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXG+uJAAKCRCxBBozTXgY
J7X/AJ9R8RfpmNGI7gqVsFwyX5kbi2NkVACfVXCZmEKyggF7qwCUeC5o47PrffY=
=rLcP
-----END PGP SIGNATURE-----

--Yzwzo2Lpb9tBI5S/--

--===============0450486955==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0450486955==--
