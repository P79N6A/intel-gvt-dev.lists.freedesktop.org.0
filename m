Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp4064236ywa;
        Tue, 19 Feb 2019 21:22:55 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYxyVKN2DIT+dCF8E5x5OHVhW6pOi6tlNZmPy2j0DiuGnwqoRJsmH8NFdXeHudNT66/z2NN
X-Received: by 2002:a17:902:7202:: with SMTP id ba2mr34311512plb.147.1550640175292;
        Tue, 19 Feb 2019 21:22:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550640175; cv=none;
        d=google.com; s=arc-20160816;
        b=uMqwHO42YQ1QKFwvIWoQdCnGBpe0Rqx1eBDPBL86bxLzK1/6hKu6qXDepUm0rQy3xl
         48wtcqgDxELbE5Ljrp+kxtpSsEjqOqk2OGGGkngMxK9SIA9GpaUV+ftVWCLyjDin3T4B
         0AZZKCgc55b25Eozs5b3uSiwdbMjcTJ5xEiyi5OgTphERWK9kSKIgkkx4sT1IauBKq8Y
         CnGhUnKPZ6EC0bQLgKGd46cnop/BDWCWJsX4Na78l0hDvCqw3B7ZHmpXN/jvunLR5zGt
         4NtPcJ/+aT1dxnGaxFCNJSB1oKdE1wYCFff3ISAmVAapttFwYQwCZ3Y51w0t6B0CtrM5
         gXgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=YUq5u64Ih/pJ6FLLARskYWo6rbCu2h/qlGiyUpwpyyw=;
        b=EhLjUlqVvBmPMXX3tWVwcEkLY0jqE9yrMOtpbnXDujV92Mffs/GWU0CSB/tGxDpxnb
         Cj5/jki7JYF8vNzWkxq3HKiiuhR8SB+cz0GZausrgDnqQifD1qFgRhpkCsPyq8LtIGd2
         s7hOx6isPjby1dQlUaX4GLcZI+rsfbDQfKxEbLp4Dq0BSoRa9P4kvGZzDGvoKWdePyyq
         VvKXUNWuwhTFEP5gx/Qwmz0RHxkzLdOgaPak5TuS27OfJ40QTAACLlSt/HsU7MmLjAhV
         onKo4XcmnHfqNeQH4ywyqJmWyzT8+KfSyAe75jzuIJNVGqaVZgveOPMyRZuXRkMOAXee
         LeiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id y5si16907226pgv.24.2019.02.19.21.22.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Feb 2019 21:22:55 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5BB688DA5;
	Wed, 20 Feb 2019 05:22:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3694988DA5
 for <intel-gvt-dev@lists.freedesktop.org>;
 Wed, 20 Feb 2019 05:22:53 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Feb 2019 21:22:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,388,1544515200"; 
 d="asc'?scan'208";a="320470742"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga006.fm.intel.com with ESMTP; 19 Feb 2019 21:22:51 -0800
Date: Wed, 20 Feb 2019 13:13:19 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: "Zhao, Yan Y" <yan.y.zhao@intel.com>
Subject: Re: [PATCH] drm/i915/gvt: Fix MI_FLUSH_DW parsing with correct index
 check
Message-ID: <20190220051319.GB12380@zhen-hp.sh.intel.com>
References: <20190218064653.26020-1-zhenyuw@linux.intel.com>
 <F22B14EC3CFBB843AD3E03B6B78F2C6A4ADAE435@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <F22B14EC3CFBB843AD3E03B6B78F2C6A4ADAE435@SHSMSX104.ccr.corp.intel.com>
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
Cc: "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============1165554456=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============1165554456==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YBGzgpgHAney5ErF"
Content-Disposition: inline


--YBGzgpgHAney5ErF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.02.19 03:30:43 +0000, Zhao, Yan Y wrote:
> Do we need to check whether the index is in DWORD or QWORD, which is spec=
ified in DWORD 0 of the command?
>

That is for MI_FLUSH_DW cmd length instead of index size I believe.
And index is always Qword aligned, but take steps of u32. So this
patch is to fix the upper bound.

> BTW, maybe we also need to check whether gma is QWORD aligned ?
>

Current code did masking on it before checking gma..

> > -----Original Message-----
> > From: intel-gvt-dev [mailto:intel-gvt-dev-bounces@lists.freedesktop.org=
] On
> > Behalf Of Zhenyu Wang
> > Sent: Monday, February 18, 2019 2:47 PM
> > To: intel-gvt-dev@lists.freedesktop.org
> > Cc: stable@vger.kernel.org
> > Subject: [PATCH] drm/i915/gvt: Fix MI_FLUSH_DW parsing with correct ind=
ex
> > check
> >=20
> > When MI_FLUSH_DW post write hw status page in index mode, the index val=
ue
> > is in dword step. This fixes wrong qword step in cmd parser code which
> > incorrectly stopped VM for invalid MI_FLUSH_DW write index.
> >=20
> > Fixes: be1da7070aea ("drm/i915/gvt: vGPU command scanner")
> > Cc: stable@vger.kernel.org # v4.10+
> > Signed-off-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gvt/cmd_parser.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > index 35b4ec3f7618..d42f7a2dc82f 100644
> > --- a/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > +++ b/drivers/gpu/drm/i915/gvt/cmd_parser.c
> > @@ -1441,7 +1441,7 @@ static inline int cmd_address_audit(struct
> > parser_exec_state *s,
> >  	}
> >=20
> >  	if (index_mode)	{
> > -		if (guest_gma >=3D I915_GTT_PAGE_SIZE / sizeof(u64)) {
> > +		if (guest_gma >=3D I915_GTT_PAGE_SIZE / sizeof(u32)) {
> >  			ret =3D -EFAULT;
> >  			goto err;
> >  		}
> > --
> > 2.20.1
> >=20
> > _______________________________________________
> > intel-gvt-dev mailing list
> > intel-gvt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--YBGzgpgHAney5ErF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXGzh7wAKCRCxBBozTXgY
J+tdAJ9gle3az5xe1GyCaLe9/JiFm57HtgCggt3OQwkmAo9N0R1Va1SBsf88PRE=
=QFJe
-----END PGP SIGNATURE-----

--YBGzgpgHAney5ErF--

--===============1165554456==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============1165554456==--
