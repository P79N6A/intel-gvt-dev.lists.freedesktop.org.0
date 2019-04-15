Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp2093547ywo;
        Sun, 14 Apr 2019 19:25:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzsfYeiD6Y1GlWRPgvMUS/zo9Vzl/aQAbLb+g4Jov1XhL21bl8lqWgzeXX6InuBD/L/ieZT
X-Received: by 2002:aa7:8818:: with SMTP id c24mr65644638pfo.129.1555295159022;
        Sun, 14 Apr 2019 19:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555295159; cv=none;
        d=google.com; s=arc-20160816;
        b=iDuR7y3k7u9Vp4J2+CoMq9i1ca5QXhCm/o45eU58UbwZMJgB1PGFraLihGIgWUgGv1
         hmtLQJ8O1/xsYCxXenOtKVhOTS/1/pxHKq+yXFBef1nDYfRQsQ3cQGxIEgzbwXZ4lvIT
         xeuNyOTYAH5S+3WLW18JjffzY/957isuU6yS+7qYdBJI+Du3in/503yH807bbmeRcIMl
         uN1L0sxrOHUddF4fwgzzFIIMMRwVddwqM8TgK9YcYgLITJ+36OZKd7bFz7m4g/qu1Jfe
         /Hlbl3QQhyCvme9hH92HwCWAxbuQEIJr51N/21aZkjL80O4dpVlFJzyu0txtbrf+Yaj0
         frpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :delivered-to;
        bh=/SSvwtwBB2RVzHfGirQEgYEiDldnP1fYRn097NEO4WA=;
        b=vdjSNQ/yNF3QKcRwutyYbaUg+DtrfyinQd+hNT7DdYq+fsYTHRBsoNy43bX1aRzSVx
         //WQlF4l8kx0LIcuKM37oiH6PqkuJ3QADYWlYD7b7RXTl2XoIpBwZvNOCGc2RZuULONT
         /6HKlwlj4t3S0ekG/2+k7i7Vdw4bGHO3qvfK0QKOwjWLe4ZJLpvPCq/qvCGBLirTX+zE
         NJV3TbUA/riAeJhmMk2fTrlOwvgsy6awOdyquWHxu9C4XnI33UGDfmPmXBpjqq+tDuo5
         layNFZxBDA85x9Tt9GTyJPyZ8F8kamIuthlHjEcK4PvHVNjsP4+2EKBFzwpnHvH11eAa
         MisA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id e13si22275490pgv.241.2019.04.14.19.25.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Apr 2019 19:25:58 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D71E89165;
	Mon, 15 Apr 2019 02:25:58 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA478915F;
 Mon, 15 Apr 2019 02:25:57 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Apr 2019 19:25:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,351,1549958400"; 
 d="asc'?scan'208";a="337485209"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2019 19:25:55 -0700
Date: Mon, 15 Apr 2019 10:14:26 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Uri Lublin <uril@redhat.com>
Subject: Re: [PATCH 0/3] i915/gvt/dmabuf: some plane 'size' fixes
Message-ID: <20190415021426.GN17995@zhen-hp.sh.intel.com>
References: <20190414144413.9708-1-uril@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20190414144413.9708-1-uril@redhat.com>
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
Cc: intel-gfx@lists.freedesktop.org, Snir Sheriber <ssheribe@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Content-Type: multipart/mixed; boundary="===============0494459233=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============0494459233==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0uCeA/GhJk5vQd80"
Content-Disposition: inline


--0uCeA/GhJk5vQd80
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019.04.14 17:44:10 +0300, Uri Lublin wrote:
> We started looking at the kvmgt driver code when we noticed
> the 'size' calculation in qemu-kvm is wrong.
> The first fix we had is now already committed upstream
> (7f1a93b1f1d1d2603a49a9e4226259db9272f305).
>    =20
> There is a mismatch between the comment for 'size' field
> of struct intel_vgpu_fb_info and the code.=20
> The comment says the plane size is kept in bytes, while
> the code keeps it in pages.
> These patches fix this problem as well as some related
> inconsistencies.

We have another series that would put size as bytes actually.
https://patchwork.freedesktop.org/series/59260/

The first one is a fix for 5.1, and second one would be queued for
next kernel.

thanks

--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--0uCeA/GhJk5vQd80
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXLPpAgAKCRCxBBozTXgY
JwBEAJ41detDAnysPAnUUgcEl6ywDhuqswCfR/NIlGnYtYz36hoVK/Na3xSIQoY=
=TTHC
-----END PGP SIGNATURE-----

--0uCeA/GhJk5vQd80--

--===============0494459233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============0494459233==--
