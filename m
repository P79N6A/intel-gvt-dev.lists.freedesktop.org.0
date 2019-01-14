Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2977873ywd;
        Mon, 14 Jan 2019 04:37:59 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6OF9pCc+Cp3+OGu0cpP6W+lHNL8EWUThigBkw2lndMf0xWtxnF9cmZXsh5T/GpWAA3dhn0
X-Received: by 2002:a62:6143:: with SMTP id v64mr25147925pfb.142.1547469479779;
        Mon, 14 Jan 2019 04:37:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547469479; cv=none;
        d=google.com; s=arc-20160816;
        b=hkme/mfHeFY7Wj7ooE2rfQpc+ZziIrugtnAdV9fednrmiK+N8JhWyQEEBslVW+ZJ1W
         /idheW5MIjru/fKngl16WCYJJLZqYK63+0BO/QVLn8KCAIz/avIiUBmK7bj95PKLVTQi
         36DIpd5Ctf2/VaTfOPivDMhwwbJhRL+spSeRI/YS7wfZTtBvpClYJOCyCMb7MH6+Kv2Z
         i4i6SvdyQf5zrykkpj1T1RxyL1pliM5QiDnyXCVBaFrfxVVmwN0Kg8/Um70hq08y9uAR
         FMoDO3JFV2OZoVjIUAzKq8ToPOJt+/BrLA8hljF9Ea2+WlDIntd24STkCSHSwjtIKqR6
         kT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:user-agent:in-reply-to:content-disposition:mime-version
         :references:message-id:subject:to:from:date:delivered-to;
        bh=axflYr+zeqP3kLSCstH+mS1M1Gbsy5uYtcsTYhnbRh8=;
        b=0HMaXHf8mKBufdCH/uuB7gtHNCuXyC3KWarV8+qqAwjz0gNZXLFJMTIk7pBzXN79eH
         B4aH69/ozYn/qlEyWJFuK3MXSNKd29gCYIB5rtEx67tKIop+SmQs0cesfNj5yCDlZISQ
         UpQ5F0ADzfZD+2/3PlWoWg/aHB7c+hW8bE4yvF7wxvD+IrHGxGgcOj1GqURloXnEuvey
         1qndDZ9vDpfHrJ3t19NZ1qvcqCPZOuHVQPgcZ4KDIi99tyJ1/ib/uQA0WPJmFrC/u7Q8
         HJvdhSN8yfC0jh31cfk76OkNxzZwHdlC103IqT0OMdcX02U0PsRc4OS1Yxtn6HPeb/VL
         5+Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id g12si235316pgh.368.2019.01.14.04.37.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jan 2019 04:37:59 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4817D6E893;
	Mon, 14 Jan 2019 12:37:59 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1859A6E893
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon, 14 Jan 2019 12:37:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id AF92C8046D;
 Mon, 14 Jan 2019 12:37:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-186.ams2.redhat.com
 [10.36.117.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7202E5EDE0;
 Mon, 14 Jan 2019 12:37:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id A6F0B9D84; Mon, 14 Jan 2019 13:37:53 +0100 (CET)
Date: Mon, 14 Jan 2019 13:37:53 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 5/5] [debug] some logging
Message-ID: <20190114123753.h6sedkqlswxkikus@sirius.home.kraxel.org>
References: <20190111093116.17188-1-kraxel@redhat.com>
 <20190111093116.17188-6-kraxel@redhat.com>
 <06341f73-6063-8cc3-dc1a-e5022ef2e032@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <06341f73-6063-8cc3-dc1a-e5022ef2e032@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 14 Jan 2019 12:37:57 +0000 (UTC)
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
 intel-gvt-dev@lists.freedesktop.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCBKYW4gMTEsIDIwMTkgYXQgMDk6MzM6NDBBTSAtMDYwMCwgRXJpYyBCbGFrZSB3cm90
ZToKPiBPbiAxLzExLzE5IDM6MzEgQU0sIEdlcmQgSG9mZm1hbm4gd3JvdGU6Cj4gPiAtLS0KPiA+
ICBody92ZmlvL2Rpc3BsYXkuYyB8IDE2ICsrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvaHcvdmZpby9kaXNw
bGF5LmMgYi9ody92ZmlvL2Rpc3BsYXkuYwo+ID4gaW5kZXggYTNhNzEwYjNlZS4uOTZiNTQ3NDI0
MyAxMDA2NDQKPiA+IC0tLSBhL2h3L3ZmaW8vZGlzcGxheS5jCj4gPiArKysgYi9ody92ZmlvL2Rp
c3BsYXkuYwo+ID4gQEAgLTQyLDYgKzQyLDggQEAgc3RhdGljIHZvaWQgdmZpb19kaXNwbGF5X2Vk
aWRfbGlua191cCh2b2lkICpvcGFxdWUpCj4gPiAgICAgIFZGSU9QQ0lEZXZpY2UgKnZkZXYgPSBv
cGFxdWU7Cj4gPiAgICAgIFZGSU9EaXNwbGF5ICpkcHkgPSB2ZGV2LT5kcHk7Cj4gPiAgCj4gPiAr
ICAgIGZwcmludGYoc3RkZXJyLCAiJXM6XG4iLCBfX2Z1bmNfXyk7Cj4gCj4gV2h5IGZwcmludGYo
KSBpbnN0ZWFkIG9mIHRyYWNlIHBvaW50cz8KCkVhc2llciBmb3IgdGVtcG9yYXJ5IHN0dWZmLiAg
SSBkb24ndCBwbGFuIHRvIGFjdHVhbGx5IG1lcmdlIHRoaXMgb25lLgoKY2hlZXJzLAogIEdlcmQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2
dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRl
dgo=
