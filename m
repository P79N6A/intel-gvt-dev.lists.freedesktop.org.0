Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp336390ywb;
        Thu, 21 Mar 2019 23:27:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzcK4K0UGNZ4IeiDYZgHZr+xQcun1VF83UivyAX7lcOMOPq0s9uf+9rjmSqYfmgJT6b7ZWq
X-Received: by 2002:a62:1c87:: with SMTP id c129mr7485123pfc.94.1553236055043;
        Thu, 21 Mar 2019 23:27:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553236055; cv=none;
        d=google.com; s=arc-20160816;
        b=WXUFYpen0qZQiORWASGYPwwg2HA/OioObmpC7i0RZwJhY0xjkvO0cPliPN92RPlWx8
         jdwbkKLYlc31HBFMln6Vh4TRsjkfARFQwROryEVpzNdxMldQcCCMy2sGntsu8ye+Vxff
         wXt0P0PCmStl1v4G/kGlx22ZtWssYGCb4SfDMsgP7OksngHbtdlkTBxIUKZEGnhpdla0
         ZoEYWN5eTmYNdDCD6MJOnqaJQOXix/Quj4mGA02R+ZsUGRZXvehdIlrjpnpfbh9dkPeG
         BeVX2pTd6NVsaPL5bQsVyk1KouwZaRen/9w5E9CMEhsCIivGT0fGyPX3aAXEm/D2sVmU
         kPAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=6yvBGDpLxxTpHzWChbE9RtNgH1CuUWF1pCYPvLlhdKo=;
        b=AatFs+rI+ULcRjKvloh6iR/pwcYtY/DwN5WW5pyqVaLjqsmp1fWBtXVC/QcYD+vIEK
         De38VFcvnO0c2n1JHyzj92xHbFo5XtnNZ9GycHY0YOiJtYtm4YJFdxH5a0J0wXBRTBkM
         ZgtaleT6hZRb4tiaL+KQvEcE/z71ibNzaCcXQv3bS1QWPPdxKPdTpkn4G6b8eLvXy+yW
         dwzp4UUCZyH64gxyjlm/3P5Hh/krmkh/HGPlqo7GXvRBvL5vAIR/d2V2qMf7M/EGyVdl
         5pn7ZwLwCZA5c7JGR7o4wfZ62OsWOZeeZBIlTJp2iJUUdQBZdYy94TowCIlDx13eOK/D
         rQrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id 31si6387982plg.364.2019.03.21.23.27.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2019 23:27:34 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7A0890E8;
	Fri, 22 Mar 2019 06:27:33 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877CE890E8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 22 Mar 2019 06:27:32 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Mar 2019 23:27:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,255,1549958400"; 
 d="asc'?scan'208";a="309379133"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga005.jf.intel.com with ESMTP; 21 Mar 2019 23:27:30 -0700
Date: Fri, 22 Mar 2019 14:16:54 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Colin Xu <colin.xu@intel.com>
Subject: Re: [PATCH 1/6] drm/i915/gvt: Prevent invalid array index access to
 vgpu->fence.regs[]
Message-ID: <20190322061654.GR10798@zhen-hp.sh.intel.com>
References: <20190320032130.9817-1-colin.xu@intel.com>
 <20190320032130.9817-2-colin.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190320032130.9817-2-colin.xu@intel.com>
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
Content-Type: multipart/mixed; boundary="===============0028500684=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0028500684==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XIT9+HGZgTFaGwcE"
Content-Disposition: inline


--XIT9+HGZgTFaGwcE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.20 11:21:25 +0800, Colin Xu wrote:
> Invalid index could result in array overflow so limit it to array size.
> Although these access are protected by current gvt logic and won't hit
> during running, but still has potential security risk in future.
>=20
> Signed-off-by: Colin Xu <colin.xu@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/aperture_gm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i91=
5/gvt/aperture_gm.c
> index 1fa2f65c3cd1..ec14d7506114 100644
> --- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
> +++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
> @@ -133,7 +133,8 @@ void intel_vgpu_write_fence(struct intel_vgpu *vgpu,
> =20
>  	assert_rpm_wakelock_held(dev_priv);
> =20
> -	if (WARN_ON(fence >=3D vgpu_fence_sz(vgpu)))
> +	if (WARN_ON(fence >=3D vgpu_fence_sz(vgpu) ||
> +		    fence >=3D INTEL_GVT_MAX_NUM_FENCES))
>  		return;

Looks unnecessary as vGPU won't use more than max fences.

> =20
>  	reg =3D vgpu->fence.regs[fence];
> --=20
> 2.21.0
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--XIT9+HGZgTFaGwcE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXJR91QAKCRCxBBozTXgY
J/JbAJ93acp+rl+zntBVZksok6OosvbQPgCdGH5wTxo+XndAtiaUOK2ciZ6PnpI=
=BdIw
-----END PGP SIGNATURE-----

--XIT9+HGZgTFaGwcE--

--===============0028500684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0028500684==--
