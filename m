Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp2481444ywo;
        Wed, 3 Apr 2019 01:25:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxkPOm8s9jnwa2xtelCsauOJPvVYOwt9+VuTMwDGDt7xa2I7FhWURUzbQTqHpcNIJPV9++
X-Received: by 2002:a62:3186:: with SMTP id x128mr56404227pfx.30.1554279945754;
        Wed, 03 Apr 2019 01:25:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554279945; cv=none;
        d=google.com; s=arc-20160816;
        b=gEMXa4BYYOdMbxb7N9SzQ0dvMHiqFWolulq8Dveq+LB+Q3nNSKs9xHXSRNB6R+xKcZ
         fZ3MGixYD8XAjaay1HC/GYP6rTBgtVH5CU5CrYVO6RwJ2gWZu0HQwyaZ1GGs1CRndlWJ
         JCqjaUc78C+LZ7MkG60y743IdkxAWxWvH9rYuSEIW0Gdn5WybD/P2vL4gF1za2PlQrM9
         kswL8DQ2luvgsJa6QCegYbbVkRCpu4hCODVpfmnl9xSFmxplJ2lepCS94Gp//DY7MyMy
         9uhqMATXilGzS6uOJ8olzd+8eyx7LBHJu+ptL4Fw8yhv+RV9U183pEy2bHiibNKKmg6d
         An0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=pCHcDLuunTt0qYTpMlgD0We0y2JZ2HcPU4YOEzwGQYc=;
        b=q8OULrgX+dbiQqlRGL9hCPq/eH3LlZBlLBVof5Hgb/nMXjdjUvKMeYIlzJs3KqJT+2
         bO3MKo+Kkncv6oE3cIOHqZqp1tl2YHxYUJ+H79mU8LjjPGixX4mk1lIcL90yJJwXu4YF
         TPALzJ1P4hVsCpAWuMSFYZ58jZm6cRfxNCWbYjBj9HwNyrZgZAGXdSsxdVO0JbkgkRIm
         C+CsX0E+GpRvGtdwHKUc899GxEoGZME7FMU+ZYwlCJ7VCO0TT9GWK91YUO5h+bofWtPe
         0Y7y3Z9ppA0RhiRtVObbdsDutJ90rXzbJJT02Py3mC2+yO4O1w+GnAKj6v0H55ohZhsn
         t3Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id z5si12955043pgb.415.2019.04.03.01.25.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Apr 2019 01:25:45 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FC3C6E859;
	Wed,  3 Apr 2019 08:25:45 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4466E859
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Apr 2019 08:25:43 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Apr 2019 01:25:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,304,1549958400"; 
 d="asc'?scan'208";a="147631100"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga002.jf.intel.com with ESMTP; 03 Apr 2019 01:25:42 -0700
Date: Wed, 3 Apr 2019 16:14:39 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>
Subject: Re: [PATCH v5] drm/i915/gvt: addressed guest GPU hang with HWS index
 mode
Message-ID: <20190403081439.GK2322@zhen-hp.sh.intel.com>
References: <20190403080728.8140-1-xiaolin.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190403080728.8140-1-xiaolin.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1322773028=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1322773028==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iRjOs3ViPWHdlw/I"
Content-Disposition: inline


--iRjOs3ViPWHdlw/I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On 2019.04.03 16:07:28 +0800, Xiaolin Zhang wrote:
> with the introduce of "switch to use HWS indices rather than address",
> guest GPU hang observed when running workloads which will update the
> seqno to the real HW HWSP, not vitural GPU HWSP and then cause GPU hang.
>=20
> this patch is to revoke index mode in PIPE_CTRL and MI_FLUSH_DW and
> patch guest GPU HWSP address value to these commands.
>=20
> Fixes: 54939ea0b("drm/i915: Switch to use HWS indices rather than
> addresses")
>=20
> v5: refine code logic to handle index_mode.
> v4: call cmd_address_audit for new address converted from index.
> v3: handle index mode to gma conversion within cmd handler itself.
> v2: PIPE_CTRL and MI_FLUSH_DW has different address offset, offset is
> also passed for gma address update. <zhenyu>
>=20
> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> ---

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index b420919279c7..083ba64c8f5d 100644
> --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> @@ -1077,6 +1077,8 @@ static int cmd_handler_pipe_control(struct parser_e=
xec_state *s)
>  	bool index_mode =3D false;
>  	unsigned int post_sync;
>  	int ret =3D 0;
> +	u32 hws_gpa;
> +	u32 val;
> =20
>  	post_sync =3D (cmd_val(s, 1) & PIPE_CONTROL_POST_SYNC_OP_MASK) >> 14;
> =20
> @@ -1100,6 +1102,15 @@ static int cmd_handler_pipe_control(struct parser_=
exec_state *s)
>  					index_mode =3D true;
>  				ret |=3D cmd_address_audit(s, gma, sizeof(u64),
>  						index_mode);
> +				if (ret)
> +					return ret;
> +				if (index_mode) {
> +					hws_gpa =3D s->vgpu->hws_pga[s->ring_id];
> +					gma =3D hws_gpa + gma;
> +					patch_value(s, cmd_ptr(s, 2), gma);
> +					val =3D cmd_val(s, 1) & (~(1 << 21));
> +					patch_value(s, cmd_ptr(s, 1), val);
> +				}
>  			}
>  		}
>  	}
> @@ -1598,6 +1609,8 @@ static int cmd_handler_mi_flush_dw(struct parser_ex=
ec_state *s)
>  	unsigned long gma;
>  	bool index_mode =3D false;
>  	int ret =3D 0;
> +	u32 hws_gpa;
> +	u32 val;
> =20
>  	/* Check post-sync and ppgtt bit */
>  	if (((cmd_val(s, 0) >> 14) & 0x3) && (cmd_val(s, 1) & (1 << 2))) {
> @@ -1608,6 +1621,15 @@ static int cmd_handler_mi_flush_dw(struct parser_e=
xec_state *s)
>  		if (cmd_val(s, 0) & (1 << 21))
>  			index_mode =3D true;
>  		ret =3D cmd_address_audit(s, gma, sizeof(u64), index_mode);
> +		if (ret)
> +			return ret;
> +		if (index_mode) {
> +			hws_gpa =3D s->vgpu->hws_pga[s->ring_id];
> +			gma =3D hws_gpa + gma;
> +			patch_value(s, cmd_ptr(s, 1), gma);
> +			val =3D cmd_val(s, 0) & (~(1 << 21));
> +			patch_value(s, cmd_ptr(s, 0), val);
> +		}
>  	}
>  	/* Check notify bit */
>  	if ((cmd_val(s, 0) & (1 << 8)))
> --=20
> 2.15.1
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--iRjOs3ViPWHdlw/I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXKRrbwAKCRCxBBozTXgY
JwexAJ0d3o7xAI9P+AsNSy8ZzK5bO27JZwCfaXFcix34sL+LmRmrsOZuYzNvBVA=
=86rq
-----END PGP SIGNATURE-----

--iRjOs3ViPWHdlw/I--

--===============1322773028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1322773028==--
