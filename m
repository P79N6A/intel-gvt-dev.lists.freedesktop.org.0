Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2754669ywd;
        Fri, 11 Jan 2019 01:31:25 -0800 (PST)
X-Google-Smtp-Source: ALg8bN77fm7QGR51vF46pfduSA8UvuFnBUQfa9oQKl6XYdkvlukIwnRzLtNtku5ceE8QvR9lQN4C
X-Received: by 2002:a63:4611:: with SMTP id t17mr12621418pga.119.1547199085921;
        Fri, 11 Jan 2019 01:31:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547199085; cv=none;
        d=google.com; s=arc-20160816;
        b=lwEWFTSgl6KwtOiyX1ezIT95LNYiQRBtVFAJRpwQMeeUslvHcBMTIOHASe7Bf4W0g9
         GpUyt7TgEsasoJl56rzDPfz5tidb/+1JaTjK0Vm7tCy0wBv50pNxIJ3EIOySLKKgk/nV
         rhkZYmnWt62zYK50eKnaYbDhRIoBxxUBhuL5b3qH0EbcoZo1aPNRfJElIX8FRM1GYDjU
         LQSqCLzoh8WM4fpdVICfXh9WwKerfOUwQ5aruTOf5PJJGwIxAN9i1H2QPoW/JxALByok
         P77vK96dJfCmY7ikHgMehPYJKYzlyooIvIhuh35jHlQ9uLxZ3HSRnGGoJpxsxih5PRyG
         YDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:references:in-reply-to:message-id:date:subject
         :to:from:delivered-to;
        bh=S63Orx9/E2I7+oEHa4zVO5Gfm2EMGrNtmdoFmMvVnQ0=;
        b=NRsE+0yYXTRgrnKdZJkBbtS/IN2nzWFv02mp/T2V5y9aJIZb9cDrRl4KPU1qlCo51Z
         sUmtJtDulJUZQj+G0zW4WLKyeRKpLXxw8jb1i4dFvX5XVIN+E3PZ1pj8w6TrZru6JA7L
         GbznBCutSVQ2tl+t2US/u2s5B/cAP9ktYHKwvTCok97D/kPU2xPFMR2+mfFVLmtaql6I
         cfOmpA9belemWCuRNrhGuPYXCo9Oo+HLqzwXczjiHplN8osNiXTA05hHU3U92fFQeA9U
         IXuUc5VP0korRv/5IdB5jPxIaSxbsTkRjDb18tptHGEYomPgBvvb41saSLHxCSzFdFtz
         9n/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id l135si5482804pga.69.2019.01.11.01.31.25
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Jan 2019 01:31:25 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CAE6F5B5;
	Fri, 11 Jan 2019 09:31:25 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA586F5B3
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri, 11 Jan 2019 09:31:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 48D71C78FA;
 Fri, 11 Jan 2019 09:31:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-186.ams2.redhat.com
 [10.36.117.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 212A05C689;
 Fri, 11 Jan 2019 09:31:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 592009AD3; Fri, 11 Jan 2019 10:31:16 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] vfio: update kernel headers.
Date: Fri, 11 Jan 2019 10:31:12 +0100
Message-Id: <20190111093116.17188-2-kraxel@redhat.com>
In-Reply-To: <20190111093116.17188-1-kraxel@redhat.com>
References: <20190111093116.17188-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Fri, 11 Jan 2019 09:31:23 +0000 (UTC)
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
Cc: Alex Williamson <alex.williamson@redhat.com>,
 intel-gvt-dev@lists.freedesktop.org, Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGVtcG9yYXJ5LCBmb3IgdGVzdGluZyBjb252aW5pZW5jZS4KCk9uY2UgcWVtdSBtYXN0ZXIgaXMg
c3luY2VkIHdpdGggdGhlIGxpbnV4IDUuMC1yYzEgaGVhZGVycwp0aGlzIGlzIG5vdCBuZWVkZWQg
YW55IG1vcmUuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4KLS0tCiBsaW51eC1oZWFkZXJzL2xpbnV4L3ZmaW8uaCB8IDUwICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1MCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvbGludXgtaGVhZGVycy9saW51eC92ZmlvLmggYi9saW51eC1o
ZWFkZXJzL2xpbnV4L3ZmaW8uaAppbmRleCBjZWI2NDUzMzk0Li41MTY2MmE3MjA5IDEwMDY0NAot
LS0gYS9saW51eC1oZWFkZXJzL2xpbnV4L3ZmaW8uaAorKysgYi9saW51eC1oZWFkZXJzL2xpbnV4
L3ZmaW8uaApAQCAtMzAzLDYgKzMwMyw1NiBAQCBzdHJ1Y3QgdmZpb19yZWdpb25faW5mb19jYXBf
dHlwZSB7CiAjZGVmaW5lIFZGSU9fUkVHSU9OX1NVQlRZUEVfSU5URUxfSUdEX0hPU1RfQ0ZHCSgy
KQogI2RlZmluZSBWRklPX1JFR0lPTl9TVUJUWVBFX0lOVEVMX0lHRF9MUENfQ0ZHCSgzKQogCisj
ZGVmaW5lIFZGSU9fUkVHSU9OX1RZUEVfR0ZYICAgICAgICAgICAgICAgICAgICAoMSkKKyNkZWZp
bmUgVkZJT19SRUdJT05fU1VCVFlQRV9HRlhfRURJRCAgICAgICAgICAgICgxKQorCisvKioKKyAq
IHN0cnVjdCB2ZmlvX3JlZ2lvbl9nZnhfZWRpZCAtIEVESUQgcmVnaW9uIGxheW91dC4KKyAqCisg
KiBTZXQgZGlzcGxheSBsaW5rIHN0YXRlIGFuZCBFRElEIGJsb2IuCisgKgorICogVGhlIEVESUQg
YmxvYiBoYXMgbW9uaXRvciBpbmZvcm1hdGlvbiBzdWNoIGFzIGJyYW5kLCBuYW1lLCBzZXJpYWwK
KyAqIG51bWJlciwgcGh5c2ljYWwgc2l6ZSwgc3VwcG9ydGVkIHZpZGVvIG1vZGVzIGFuZCBtb3Jl
LgorICoKKyAqIFRoaXMgc3BlY2lhbCByZWdpb24gYWxsb3dzIHVzZXJzcGFjZSAodHlwaWNhbGx5
IHFlbXUpIHNldCBhIHZpcnR1YWwKKyAqIEVESUQgZm9yIHRoZSB2aXJ0dWFsIG1vbml0b3IsIHdo
aWNoIGFsbG93cyBhIGZsZXhpYmxlIGRpc3BsYXkKKyAqIGNvbmZpZ3VyYXRpb24uCisgKgorICog
Rm9yIHRoZSBlZGlkIGJsb2Igc3BlYyBsb29rIGhlcmU6CisgKiAgICBodHRwczovL2VuLndpa2lw
ZWRpYS5vcmcvd2lraS9FeHRlbmRlZF9EaXNwbGF5X0lkZW50aWZpY2F0aW9uX0RhdGEKKyAqCisg
KiBPbiBsaW51eCBzeXN0ZW1zIHlvdSBjYW4gZmluZCB0aGUgRURJRCBibG9iIGluIHN5c2ZzOgor
ICogICAgL3N5cy9jbGFzcy9kcm0vJHtjYXJkfS8ke2Nvbm5lY3Rvcn0vZWRpZAorICoKKyAqIFlv
dSBjYW4gdXNlIHRoZSBlZGlkLWRlY29kZSB1bGlsaXR5IChjb21lcyB3aXRoIHhvcmcteDExLXV0
aWxzKSB0bworICogZGVjb2RlIHRoZSBFRElEIGJsb2IuCisgKgorICogQGVkaWRfb2Zmc2V0OiBs
b2NhdGlvbiBvZiB0aGUgZWRpZCBibG9iLCByZWxhdGl2ZSB0byB0aGUKKyAqICAgICAgICAgICAg
ICAgc3RhcnQgb2YgdGhlIHJlZ2lvbiAocmVhZG9ubHkpLgorICogQGVkaWRfbWF4X3NpemU6IG1h
eCBzaXplIG9mIHRoZSBlZGlkIGJsb2IgKHJlYWRvbmx5KS4KKyAqIEBlZGlkX3NpemU6IGFjdHVh
bCBlZGlkIHNpemUgKHJlYWQvd3JpdGUpLgorICogQGxpbmtfc3RhdGU6IGRpc3BsYXkgbGluayBz
dGF0ZSAocmVhZC93cml0ZSkuCisgKiBWRklPX0RFVklDRV9HRlhfTElOS19TVEFURV9VUDogTW9u
aXRvciBpcyB0dXJuZWQgb24uCisgKiBWRklPX0RFVklDRV9HRlhfTElOS19TVEFURV9ET1dOOiBN
b25pdG9yIGlzIHR1cm5lZCBvZmYuCisgKiBAbWF4X3hyZXM6IG1heCBkaXNwbGF5IHdpZHRoICgw
ID09IG5vIGxpbWl0YXRpb24sIHJlYWRvbmx5KS4KKyAqIEBtYXhfeXJlczogbWF4IGRpc3BsYXkg
aGVpZ2h0ICgwID09IG5vIGxpbWl0YXRpb24sIHJlYWRvbmx5KS4KKyAqCisgKiBFRElEIHVwZGF0
ZSBwcm90b2NvbDoKKyAqICAgKDEpIHNldCBsaW5rLXN0YXRlIHRvIGRvd24uCisgKiAgICgyKSB1
cGRhdGUgZWRpZCBibG9iIGFuZCBzaXplLgorICogICAoMykgc2V0IGxpbmstc3RhdGUgdG8gdXAu
CisgKi8KK3N0cnVjdCB2ZmlvX3JlZ2lvbl9nZnhfZWRpZCB7CisJX191MzIgZWRpZF9vZmZzZXQ7
CisJX191MzIgZWRpZF9tYXhfc2l6ZTsKKwlfX3UzMiBlZGlkX3NpemU7CisJX191MzIgbWF4X3hy
ZXM7CisJX191MzIgbWF4X3lyZXM7CisJX191MzIgbGlua19zdGF0ZTsKKyNkZWZpbmUgVkZJT19E
RVZJQ0VfR0ZYX0xJTktfU1RBVEVfVVAgICAgMQorI2RlZmluZSBWRklPX0RFVklDRV9HRlhfTElO
S19TVEFURV9ET1dOICAyCit9OworCiAvKgogICogVGhlIE1TSVggbWFwcGFibGUgY2FwYWJpbGl0
eSBpbmZvcm1zIHRoYXQgTVNJWCBkYXRhIG9mIGEgQkFSIGNhbiBiZSBtbWFwcGVkCiAgKiB3aGlj
aCBhbGxvd3MgZGlyZWN0IGFjY2VzcyB0byBub24tTVNJWCByZWdpc3RlcnMgd2hpY2ggaGFwcGVu
ZWQgdG8gYmUgd2l0aGluCi0tIAoyLjkuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2Cg==
