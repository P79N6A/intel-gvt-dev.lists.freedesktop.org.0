Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp3305729ywb;
        Mon, 25 Mar 2019 00:01:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwniuN3Y1kS5WiCeXhEn4xrCBJvGoVKEvIR/CqBv+5swKyfA6wlqPyp9v2aL1v8iKpeIbbz
X-Received: by 2002:a63:4a5a:: with SMTP id j26mr13762436pgl.361.1553497269477;
        Mon, 25 Mar 2019 00:01:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553497269; cv=none;
        d=google.com; s=arc-20160816;
        b=TSfXf67WioCOLDaPWg4OzN36rgIY9mfNxK8l6pVMylk5UTJUfWBaxusHDPKUz8uDcZ
         JxyoB6A8rT1KEd8JfHHs59XwhSzyVvXNPWiL7pkz3+h/MozhA8p+GR4DmiKHkAWXSD7s
         WIyWuxoldN8uqxNsDeg81LMDSI8UIHQ4JZwjEeUBkB7LIbtoHJ+StnAlXX3j504JeIPS
         1dHUHVSzpGH3XmMDdjkLXDnbnZ+VXLQW2mdWwyeHX8rOywIX/BTsEDPaYC75U3asrCn1
         61dGblEJH/+iLv3ATd2eY528dZ/Z2fEXfZ2RJU7uu/u3FkF2bOT7POtx9iTKmUWhx3py
         4DRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=gT0uOWlvZwE90T039XFoT2FjYRwNRo1paBNcDQPHW44=;
        b=Sg+ccGIbvkNqYyB9V3Sg9PrhCJqJsh9L3fUGeUYeE/HzTDX7YthCCSt6zoNuiW53Yy
         QAcQBLDKThPNykmR6NEfUj+4TYfOiYFE07dhycSl6NhxPpIrUAbULDrGUQtzrZLdochn
         TgeLigRtfvxMjbfOlcPaI0hxkp4UtgxNODCMILJiP8ibpe51wxxu+i28fe/uXSSDEvXa
         QcJJ9gUeaq090/UEtdcXmNHGvEJlRwic+KlnsCiNHblGto5+19rxQWmgEI2VM0OY6dOX
         Iam4bAmz/gmG9v5S96fD6AcH8IkisfbLevu2sgengeoH0WPjHYgs33/MwFU5XMQsBfx2
         ZX7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id y17si2105171plr.204.2019.03.25.00.01.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2019 00:01:09 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26806E651;
	Mon, 25 Mar 2019 07:01:08 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2608F6E651
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 25 Mar 2019 07:01:07 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Mar 2019 00:01:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,256,1549958400"; 
 d="asc'?scan'208";a="331693780"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga005.fm.intel.com with ESMTP; 25 Mar 2019 00:01:05 -0700
Date: Mon, 25 Mar 2019 14:50:22 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: support MI_SEMAPHORE_WAIT
Message-ID: <20190325065022.GY10798@zhen-hp.sh.intel.com>
References: <20190325061514.25338-1-yan.y.zhao@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190325061514.25338-1-yan.y.zhao@intel.com>
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
Content-Type: multipart/mixed; boundary="===============2132953377=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2132953377==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2dKNoLeXnWu5vox"
Content-Disposition: inline


--J2dKNoLeXnWu5vox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.03.25 02:15:14 -0400, Yan Zhao wrote:
> in linux 5.0, i915 driver now uses MI_SEMAPHORE_WAIT to sync requests.

Not in 5.0 kernel, but currently in drm-intel-next which should go for 5.2 =
kernel.

> GVT-g should add support for this command now

"otherwise i915 guest would fail in GVT cmd parser which caused guest VM fa=
ilure."

>
> Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index a16e527e9f02..e98f0a0d3083 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -1538,7 +1538,30 @@ static int cmd_handler_mi_store_data_imm(struct pa=
rser_exec_state *s)
> =20
>  static int cmd_handler_mi_semaphore_wait(struct parser_exec_state *s)
>  {
> -	return unexpected_cmd(s);
> +	unsigned long gma, gma_high;
> +	int ret =3D 0;
> +	int cmd_len =3D cmd_length(s);
> +	struct intel_vgpu *vgpu =3D s->vgpu;
> +	int gma_len =3D sizeof(u32);
> +
> +	if (cmd_len !=3D 4 && cmd_len !=3D 5) {
> +		gvt_vgpu_err("Illegal cmd length %d\n", cmd_len);
> +		return -EINVAL;
> +	}
> +
> +	/* ppgtt is always safe */
> +	if (!(cmd_val(s, 0) & (1 << 22)))
> +		return ret;
> +
> +	gma =3D cmd_val(s, 2) & GENMASK(31, 0);
> +	if (cmd_len =3D=3D 5) {
> +		gma_high =3D cmd_val(s, 3) & GENMASK(31, 0);
> +		gma =3D (gma_high << 32) | gma;
> +		gma_len =3D sizeof(u64);
> +	}
> +	ret =3D cmd_address_audit(s, gma, gma_len, false);
> +	return ret;
> +
>  }
> =20
>  static int cmd_handler_mi_report_perf_count(struct parser_exec_state *s)
> --=20
> 2.17.1
>=20
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--J2dKNoLeXnWu5vox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXJh6LgAKCRCxBBozTXgY
Jy7KAJ47LVwL4fy43aafPs8CsaF3yg5zzACePwxU/DVEMjQrt5piNEYJDufTFFs=
=yhJ+
-----END PGP SIGNATURE-----

--J2dKNoLeXnWu5vox--

--===============2132953377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============2132953377==--
