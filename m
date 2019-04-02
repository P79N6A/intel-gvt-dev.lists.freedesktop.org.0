Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp1361012ywo;
        Tue, 2 Apr 2019 02:51:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyoS+Z+29HwxgzZFmQVzQcrAcOAXuKF7eYHnnwyLRc+TwaUkRQNQ7OQccnA33po+aZqQGrX
X-Received: by 2002:a62:4815:: with SMTP id v21mr65836477pfa.167.1554198702729;
        Tue, 02 Apr 2019 02:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554198702; cv=none;
        d=google.com; s=arc-20160816;
        b=tjG9Q+E/OdrrWgK7WjAsIHp70vCu1rnjkOCncjESBT3djSCABlYYkZTL5vVeSapYZc
         RdaCjZC1zK3G8CkDwPV8hRpQxOZapOq8PBtVFLqP9Nq+ORvM+tCeKs6iB9gYrZwCrAxQ
         Q68dKtTsDQ5SVXKIiWw1H/hJaZbHWSg4lgXuFMTG75pXWk/m430gplTNygssaX95/yVw
         eF2SdTgbZkUAV6jsuLaKK4DgqkjqCA/eekbSKPohkOPuepj87LHVQNAm4yjs/M4sCzxO
         g3khMUXmsaEfnqsTDDh/5kIHuuiAuAhkiGsdQ0RFuTQnY4lK7nS0nN97f3iYzzXE9vxq
         K+8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :mime-version:message-id:subject:to:from:date:delivered-to;
        bh=AHl7nnKZMqG2ErKhqE/DmxMbyOxQnSDJlmKpHnku3ng=;
        b=w4uWDeR1LZzPe2KKefmP30a4/Fhtd4Jh6GBMTmX9+jvvcPDoLkV7Iy1AZhmmcdv1zz
         Z9d2GaY13Tz4sgAyo6xX8kd/Elj5Efw+KtWcGY/+gA4TnJDJELGGRS3hhwDrC9xyXTS2
         2DP7QHWPySTcE81HXQrkQv8gPAa+K8itVomO6zUq9YoTaNn3fbjyrYzSWq63iWFVYX5i
         t52lISZe+FS4wiks4oQqhsyN7eMyVMm0mVuORPlmiYtQ4D7RRaPy6bEZXDVpxK+ivSd9
         xE+DQqBgM+ifaJzTLG7/gEVSpzM86pe1ejVFuKN1TWKXb1tqTKbSczXyxEAsRJUleush
         g94g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id f9si10575823pgq.347.2019.04.02.02.51.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Apr 2019 02:51:42 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D636E768;
	Tue,  2 Apr 2019 09:51:41 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078A66E768;
 Tue,  2 Apr 2019 09:51:40 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Apr 2019 02:51:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,300,1549958400"; 
 d="asc'?scan'208";a="147316913"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.13.116])
 by orsmga002.jf.intel.com with ESMTP; 02 Apr 2019 02:51:38 -0700
Date: Tue, 2 Apr 2019 17:40:37 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: [PULL] gvt-fixes
Message-ID: <20190402094037.GB2322@zhen-hp.sh.intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 intel-gvt-dev <intel-gvt-dev@lists.freedesktop.org>, "Lv,
 Zhiyuan" <zhiyuan.lv@intel.com>, Zhi Wang <zhi.a.wang@intel.com>, "Yuan,
 Hang" <hang.yuan@intel.com>
Content-Type: multipart/mixed; boundary="===============2134286934=="
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>


--===============2134286934==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Hi,

Here's gvt-fixes for 5.1-rc4 which includes misc fixes for
vGPU display plane size calculation, shadow mm pin count,
error recovery path for workload create and one kerneldoc
fix which I missed to include before.

Thanks.
--
The following changes since commit 26cdaac4793c49357d2c731f2190632cefb7efb1:

  drm/i915/icl: Fix VEBOX mismatch BUG_ON() (2019-03-28 15:36:40 +0200)

are available in the Git repository at:

  https://github.com/intel/gvt-linux.git tags/gvt-fixes-2019-04-02

for you to fetch changes up to a14f068545cc13db9e0ad0ea451ec42e5abc97c0:

  drm/i915/gvt: Fix kerneldoc typo for intel_vgpu_emulate_hotplug (2019-03-=
29 10:31:15 +0800)

----------------------------------------------------------------
gvt-fixes-2019-04-02

- Fix shadow mm pin count (Yan)
- Fix cmd parser error path recover (Yan)
- Fix vGPU display plane size calculation (Xiong)
- Fix kerneldoc (Chris)

----------------------------------------------------------------
Chris Wilson (1):
      drm/i915/gvt: Fix kerneldoc typo for intel_vgpu_emulate_hotplug

Xiong Zhang (1):
      drm/i915/gvt: Correct the calculation of plane size

Yan Zhao (2):
      drm/i915/gvt: do not deliver a workload if its creation fails
      drm/i915/gvt: do not let pin count of shadow mm go negative

 drivers/gpu/drm/i915/gvt/display.c   | 2 +-
 drivers/gpu/drm/i915/gvt/dmabuf.c    | 8 ++------
 drivers/gpu/drm/i915/gvt/gtt.c       | 2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c | 5 +++--
 4 files changed, 7 insertions(+), 10 deletions(-)


--=20
Open Source Technology Center, Intel ltd.

$gpg --keyserver wwwkeys.pgp.net --recv-keys 4D781827

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCXKMuFQAKCRCxBBozTXgY
J0RZAJ9zu1DAkZlHn+KVeZDQaIfjW/fzngCgnq1kAv51QFa4I7CAq11rFoLxEtw=
=nNm2
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--

--===============2134286934==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2

--===============2134286934==--
