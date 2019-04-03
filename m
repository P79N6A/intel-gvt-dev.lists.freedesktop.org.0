Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp2388469ywo;
        Tue, 2 Apr 2019 23:20:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzVecuhM43IGz2FSA1n62r8BA4hpE7315Fo5jFt7BhiiBvWv3k+E4BcStoOFICZtQ6n4nkm
X-Received: by 2002:a62:70c6:: with SMTP id l189mr21196920pfc.139.1554272406138;
        Tue, 02 Apr 2019 23:20:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554272406; cv=none;
        d=google.com; s=arc-20160816;
        b=yYLBR4PkN3PMpZwuDdQoyCKc9eNiBJWNU8vYIra72m1lIYoTT5gtCFrfEdSOAgpzP+
         n+AUBNzgnloj7xT1kQSRZefwx92wt2BRunslGXlHl3R5J3LbgG9MKhAI2X4/xZfJls75
         ea+J/4S2d8OEXcGpXgbStNBhJcLOyR1K0GdUf83sEFxGuVebfr1uQyUtM6dlJVUuzNK2
         bCenmVGQUDWDNoQ0GD3kGmY7PIIdzEITwO3EO4bJ+c0m/31W5aaC2DH6FF93CrVebRGs
         WpHFd0HxE9x1PJ25WbQlQUNFmvEns+VXH26nf7F9N8cP4SpqAsz/JO7vUC/dJtibyai8
         5fcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=+emiyouqxle14Xcrm2vrZXgkHkU/S5lWYmkb3GAiPVw=;
        b=NW1vbteLmFtPtg5gNKt7ELKWzHKtp73vVJPy+n7O70qKB8MlQRZKJA3AIlpdo+GCQZ
         oYdC85c7DibeMoZcg8QHa3hBbcW/1P0PwgWSMQiyiwe1PKx1n6/DY1cOae+PQQuVeBs4
         EwNxFj/d04fhUXALqc38OZHIk5Bu/BMgPpbMazFk1dbtjlTZdqX3Lrv/WOb+Ecy8r+1A
         +9VNq8kx/QXeIIdNVO3VGX4tkz0gP0PAGMqFmq4BZuhvbmkprJFBS4xCGA6K+H0ah1kh
         k3anC0MXVeoQvhSsNgBVN+auaBZyo7JvjnqztrkETstsfdWzVmkEcWazUenelaUtMfOI
         4Uhg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id cb16si4586407plb.227.2019.04.02.23.20.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2019 23:20:06 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728AE6E81E;
	Wed,  3 Apr 2019 06:20:05 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DC26E81E
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed,  3 Apr 2019 06:20:03 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Apr 2019 23:20:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,303,1549958400"; 
 d="asc'?scan'208";a="132527388"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga006.jf.intel.com with ESMTP; 02 Apr 2019 23:19:59 -0700
Date: Wed, 3 Apr 2019 14:08:57 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Xiaolin Zhang <xiaolin.zhang@intel.com>
Subject: Re: [PATCH v3] drm/i915/gvt: addressed guest GPU hang with HWS index
 mode
Message-ID: <20190403060857.GJ2322@zhen-hp.sh.intel.com>
References: <20190403053244.3487-1-xiaolin.zhang@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190403053244.3487-1-xiaolin.zhang@intel.com>
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
Content-Type: multipart/mixed; boundary="===============1066828899=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1066828899==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IbA9xpzOQlG26JSn"
Content-Disposition: inline


--IbA9xpzOQlG26JSn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.04.03 13:32:44 +0800, Xiaolin Zhang wrote:
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
> v3: handle index mode to gma conversion within cmd handler itself.
> v2: PIPE_CTRL and MI_FLUSH_DW has different address offset, offset is
> also passed for gma address update. <zhenyu>
>=20
> Signed-off-by: Xiaolin Zhang <xiaolin.zhang@intel.com>
> ---
>  drivers/gpu/drm/i915/gvt/cmd_parser.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c b/drivers/gpu/drm/i915=
/gvt/cmd_parser.c
> index b420919279c7..55c78f6b41f7 100644
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
> @@ -1098,8 +1100,16 @@ static int cmd_handler_pipe_control(struct parser_=
exec_state *s)
>  				/* Store Data Index */
>  				if (cmd_val(s, 1) & (1 << 21))
>  					index_mode =3D true;
> -				ret |=3D cmd_address_audit(s, gma, sizeof(u64),
> -						index_mode);
> +				if (index_mode) {
> +					hws_gpa =3D s->vgpu->hws_pga[s->ring_id];
> +					gma =3D hws_gpa + gma;
> +					gma |=3D cmd_val(s, 2) & GENMASK(2, 0);

This looks unnecessary as address should be aligned.

And as we will patch by gfx address, shouldn't we do memory range check as =
well
for possible out of range index? We still need to call cmd_address_audit() =
anyway.

> +					patch_value(s, cmd_ptr(s, 2), gma);
> +					val =3D cmd_val(s, 1) & (~(1 << 21));
> +					patch_value(s, cmd_ptr(s, 1), val);
> +				} else
> +					ret |=3D cmd_address_audit(s, gma,
> +						sizeof(u64), index_mode);
>  			}
>  		}
>  	}
> @@ -1598,6 +1608,8 @@ static int cmd_handler_mi_flush_dw(struct parser_ex=
ec_state *s)
>  	unsigned long gma;
>  	bool index_mode =3D false;
>  	int ret =3D 0;
> +	u32 hws_gpa;
> +	u32 val;
> =20
>  	/* Check post-sync and ppgtt bit */
>  	if (((cmd_val(s, 0) >> 14) & 0x3) && (cmd_val(s, 1) & (1 << 2))) {
> @@ -1607,7 +1619,16 @@ static int cmd_handler_mi_flush_dw(struct parser_e=
xec_state *s)
>  		/* Store Data Index */
>  		if (cmd_val(s, 0) & (1 << 21))
>  			index_mode =3D true;
> -		ret =3D cmd_address_audit(s, gma, sizeof(u64), index_mode);
> +		if (index_mode) {
> +			hws_gpa =3D s->vgpu->hws_pga[s->ring_id];
> +			gma =3D hws_gpa + gma;
> +			gma |=3D cmd_val(s, 1) & GENMASK(2, 0);
> +			patch_value(s, cmd_ptr(s, 1), gma);
> +			val =3D cmd_val(s, 0) & (~(1 << 21));
> +			patch_value(s, cmd_ptr(s, 0), val);
> +		} else
> +			ret =3D cmd_address_audit(s, gma,
> +					sizeof(u64), index_mode);

ditto for address audit

>  	}
>  	/* Check notify bit */
>  	if ((cmd_val(s, 0) & (1 << 8)))
> --=20
> 2.15.1
>=20

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--IbA9xpzOQlG26JSn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXKRN+QAKCRCxBBozTXgY
J4K0AJ4tzWHw6Sdgxsx/Oly1yoJiEBaD1wCfXTk4UTgVAYZXB7y4bM6v3FlU620=
=PQf3
-----END PGP SIGNATURE-----

--IbA9xpzOQlG26JSn--

--===============1066828899==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1066828899==--
