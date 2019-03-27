Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:5710:0:0:0:0:0 with SMTP id l16csp5759211ywb;
        Wed, 27 Mar 2019 02:15:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyXVmkofzU3GNqV0B8f0glAbg5halJGT+zQwRP+PbfCht8PHAQ+2Yblo+j7vCsix/xWzUv/
X-Received: by 2002:a17:902:5c5:: with SMTP id f63mr32697907plf.64.1553678154700;
        Wed, 27 Mar 2019 02:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553678154; cv=none;
        d=google.com; s=arc-20160816;
        b=WjEEZS3qK6zZOYScvEaZi3PL3l0ojNHMwZ239LHl7SJg55l59IXFmaLA9/WW1t1bek
         v9PsFgKg0iuwvBgM35gy61vgnZtZ2WKc7cSXALLeLl8vBENCEZNj9MlZXdY1RKYAE45k
         qxYMJwb4FvJ7XGBb9PYwj4PFKTnbc13bTuxE5JOSWVPHQ4irtvYIQGgb67l2GOAEajfD
         ilYFKuSySlNLq11xMOpoygRmuwdvnCDU1xNIoHCY98LXAA/Hu1BOMPdKQQrS3QERh2Jz
         DfychXcRV9in3M1Ooc9poQcbI75ge+ddMK6+8xtO6AjpVotuGAApJklD0vvKvBzX/iOs
         Mk9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:date:subject:user-agent:message-id:references
         :in-reply-to:from:to:mime-version:delivered-to;
        bh=hekccG91SOFqj02q2DM9Zu9ZgYMLpc6jKk/FGYiYyz8=;
        b=0M5nEvQQmfCeymemG5tGhW0q77SKCX8TQ9hxy/S7Hqt97vFEUAJKyqCAxZ+QHt1LCe
         GV8X2LDmLQVp3ObGs6QtRrmMQFT/teSjeuK3nRYpkDBs2Xf8HOk/WFukA6vhnyKfcsAU
         1MvnxGdaC+j36qsv0EmB0T+4UDDz7MnUshzq5lLdlyjJYtx4tkWuUI5+/iKRdktiqEDk
         aWCVWMwzJaPy2vlD0VEMqVhmaubDixrkE0wIkgY4B5fv2MXm/fYEixWxLANVFKuLPsSA
         oyPpoCEwH2E+GHBIs+JfBbPVH9RftmkV1owCbRIm/L0ASkWJCEl5fST7PkVhwRpvTsja
         hL+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id 17si17045370pfw.6.2019.03.27.02.15.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Mar 2019 02:15:54 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B9A8938B;
	Wed, 27 Mar 2019 09:15:54 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DC88938B;
 Wed, 27 Mar 2019 09:15:52 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 16032700-1500050 for multiple; Wed, 27 Mar 2019 09:15:37 +0000
MIME-Version: 1.0
To: Zhenyu Wang <zhenyuw@linux.intel.com>, intel-gfx@lists.freedesktop.org
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190327090636.3547-1-zhenyuw@linux.intel.com>
References: <20190327090636.3547-1-zhenyuw@linux.intel.com>
Message-ID: <155367813647.24691.10538359395237455801@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i915: Disable semaphore on vGPU for now
Date: Wed, 27 Mar 2019 09:15:36 +0000
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
Cc: Kevin Tian <kevin.tian@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

UXVvdGluZyBaaGVueXUgV2FuZyAoMjAxOS0wMy0yNyAwOTowNjozNikKPiBUaGlzIGlzIHRvIGRp
c2FibGUgc2VtYXBob3JlIHVzYWdlIHdoZW4gb24gdkdQVSBmb3Igbm93LiBVbmZvcnR1bmF0ZWx5
Cj4gR1ZULWcgaGFzbid0IGZ1bGx5IGVuYWJsZWQgc2VtYXBob3JlIHVzYWdlIHlldCwgc28gY3Vy
cmVudCBndWVzdCB3aXRoCj4gc2VtYXBob3JlIHVzZSB3b3VsZCBjYXVzZSB2R1BVIGZhaWx1cmUu
Cj4gCj4gQWx0aG91Z2ggY3VycmVudCBzZW1hcGhvcmUgZmFpbHVyZSB3aXRoIHZHUFUgY2FuIGJl
IHNpbXBseSByZXNvbHZlZCBieQo+IGFsbG93aW5nIGNtZCBwYXJzZXIgdG8gYWNjZXB0IE1JX1NF
TUFQSE9SRV9XQUlUIGNvbW1hbmQgd2l0aCBhZGRyZXNzCj4gYXVkaXQsIHdlJ3JlIGNoZWNraW5n
IGdlbmVyYWwgdXNhZ2Ugb2Ygc2VtYXBob3JlIGFuZCBob3cgd2Ugc2hvdWxkCj4gaGFuZGxlIGl0
IHByb3Blcmx5IGZvciB2aXJ0dWFsaXphdGlvbiBpbiBjb25zaWRlciBvZiBmdW5jdGlvbiBhbmQK
PiBzZWN1cml0eSBjb25jZXJuLiBTbyB3ZSBkZWNpZGUgdG8gcmVxdWVzdCB0byBkaXNhYmxlIGl0
IGZvciBub3cgaW4KPiBndWVzdCBkcml2ZXIuIE9uY2UgR1ZUIGNvdWxkIHN1cHBvcnQgaXQsIHdl
IHdvdWxkIGFkZCBuZXcgY29tcGF0IGJpdAo+IHRvIHR1cm4gaXQgb24uCgpNSV9XQUlUX1NFTUFQ
SE9SRSBhcmUgdXNlZCBieSBWdWxrYW4gKGFudmlsKSBhcyB3ZWxsIGZvciBWa0V2ZW50cy4KLUNo
cmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVs
LWd2dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0
LWRldg==
