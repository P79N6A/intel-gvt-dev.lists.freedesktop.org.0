Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:e6c5:0:0:0:0:0 with SMTP id p188csp8465775ywe;
        Fri, 8 Mar 2019 13:16:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqwAE08PsNSQK25qkafYHDnVGpJItJmTlF6rdBQc6QxHqYMb6PRyCDZO3HWTHLIEo67+uASB
X-Received: by 2002:a63:780e:: with SMTP id t14mr632802pgc.276.1552079788518;
        Fri, 08 Mar 2019 13:16:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552079788; cv=none;
        d=google.com; s=arc-20160816;
        b=gHF6h6xnrrdW9DqM45kTmxRNZegyRheIieUNJqsA5rFby/+3jJ4GwKG9qFXeMEtryz
         pjp/fRdlIHUgCQwEGH1HgHro/n6CQSttjpwgPUDKBLTgwmWkZEH2cTM+4MLKLHWaMF5h
         R4MQpttXx5x920REoLw+shmbrxhvgfYNIz7n11g5CD3LKhJwpO0T+JiuFIKojPefpSS+
         9hNWHEtRoU4f1DMhvBPlfgSvlnKk34b8UH3j6xFYW3uNWE2NnoW1vHJtZz1nZH8dJPuj
         2jvaP8+uEIEK69PxiAbijN0bHCqRRN5gCFrDDlmRnr65pJlCKvmc3iIe8I3/jKL9OCb/
         BCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:organization:references:in-reply-to
         :message-id:subject:to:from:date:delivered-to;
        bh=NqJxbI8HrxZtSCwlurCIVOOVsUoxysws6qjho2dPm+c=;
        b=bjaPEvqFmn3SJy9RpkPZQSAnLWAtuoMkDZtojXpOxfx3wBOU7iWy9oG/UZ1GfLSuCZ
         VVgRCoQSAFoGJDD3vGYf7fGdYoqcNzOqJMGjKA9xNfwXuH4Wn8TYt3uYonDXaUXX3EUM
         7mkgGAD+OAtlBmJdmSeFCyeJYBlRuGmk9ACaWeYgVRLZp46Avwhqp0Uag2Xb8wD1aLMJ
         QhP9EMCvnBjt0jkyC5yIQ/oyIfMlqgpEMKke4W+NsvTbM3GBpjIJaTntNHV+PALwohI2
         nWxOj5x26Ax+2DXWX21Yy/NzZP37hKtj6WSzX+7+fRtcAC9TpgxIDJiAVrUH0aJ7TzDY
         nbaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id o2si7063287pgh.565.2019.03.08.13.16.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2019 13:16:28 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2046E426;
	Fri,  8 Mar 2019 21:16:28 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAA5D6E425
 for <intel-gvt-dev@lists.freedesktop.org>;
 Fri,  8 Mar 2019 21:16:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6F1FF30D78C1;
 Fri,  8 Mar 2019 21:16:26 +0000 (UTC)
Received: from x1.home (ovpn-116-24.phx2.redhat.com [10.3.116.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 653C95D787;
 Fri,  8 Mar 2019 21:16:23 +0000 (UTC)
Date: Fri, 8 Mar 2019 14:16:23 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v3 3/3] vfio/display: delay link up event
Message-ID: <20190308141623.566cfda4@x1.home>
In-Reply-To: <cd99a2cc-a7e8-ef80-69b3-2082d28a3352@oracle.com>
References: <20190222054939.19739-1-kraxel@redhat.com>
 <20190222054939.19739-4-kraxel@redhat.com>
 <cd99a2cc-a7e8-ef80-69b3-2082d28a3352@oracle.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 08 Mar 2019 21:16:26 +0000 (UTC)
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
Cc: Liam Merwick <liam.merwick@oracle.com>, intel-gvt-dev@lists.freedesktop.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gRnJpLCAyMiBGZWIgMjAxOSAxMToxOToxMSArMDAwMApMaWFtIE1lcndpY2sgPGxpYW0ubWVy
d2lja0BvcmFjbGUuY29tPiB3cm90ZToKCj4gT24gMjIvMDIvMjAxOSAwNTo0OSwgR2VyZCBIb2Zm
bWFubiB3cm90ZToKPiA+IEtpY2sgdGhlIGRpc3BsYXkgbGluayB1cCBldmVudCB3aXRoIGEgMC4x
IHNlYyBkZWxheSwKPiA+IHNvIHRoZSBndWVzdCBoYXMgYSBjaGFuY2UgdG8gbm90aWNlIHRoZSBs
aW5rIGRvd24gZmlyc3QuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEdlcmQgSG9mZm1hbm4gPGty
YXhlbEByZWRoYXQuY29tPiAgCj4gCj4gRGVwZW5kaW5nIG9uIHlvdXIgdGhvdWdodHMgb24gdGhl
IHN1Z2dlc3Rpb24gaW4gcGF0Y2ggMSByZWdhcmRpbmcgYSAKPiBjb21tZW50IGF0IHRoZSAnZXJy
JyBsYWJlbCAtIGFub3RoZXIgY2FuZGlkYXRlIGluIAo+IHZmaW9fZGlzcGxheV9lZGlkX2xpbmtf
dXAoKS4KClRoaXMgd291bGQgYWxzbyBnZXQgdGhlIGZvbGxvd2luZyBmaXh1cCByb2xsZWQgaW4u
ICBUaGFua3MsCgpBbGV4CgogaHcvdmZpby9kaXNwbGF5LmMgfCAgICA0ICsrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9ody92
ZmlvL2Rpc3BsYXkuYyBiL2h3L3ZmaW8vZGlzcGxheS5jCmluZGV4IGU4ZjMxMmRjMzMwOC4uYTNk
OWM4ZjViZWFjIDEwMDY0NAotLS0gYS9ody92ZmlvL2Rpc3BsYXkuYworKysgYi9ody92ZmlvL2Rp
c3BsYXkuYwpAQCAtNDQsNyArNDQsOSBAQCBzdGF0aWMgdm9pZCB2ZmlvX2Rpc3BsYXlfZWRpZF9s
aW5rX3VwKHZvaWQgKm9wYXF1ZSkKICAgICBpbnQgZmQgPSB2ZGV2LT52YmFzZWRldi5mZDsKIAog
ICAgIGRweS0+ZWRpZF9yZWdzLT5saW5rX3N0YXRlID0gVkZJT19ERVZJQ0VfR0ZYX0xJTktfU1RB
VEVfVVA7Ci0gICAgcHdyaXRlX2ZpZWxkKGZkLCBkcHktPmVkaWRfaW5mbywgZHB5LT5lZGlkX3Jl
Z3MsIGxpbmtfc3RhdGUpOworICAgIGlmIChwd3JpdGVfZmllbGQoZmQsIGRweS0+ZWRpZF9pbmZv
LCBkcHktPmVkaWRfcmVncywgbGlua19zdGF0ZSkpIHsKKyAgICAgICAgZ290byBlcnI7CisgICAg
fQogICAgIHRyYWNlX3ZmaW9fZGlzcGxheV9lZGlkX2xpbmtfdXAoKTsKICAgICByZXR1cm47CiAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW50ZWwtZ3Z0
LWRldiBtYWlsaW5nIGxpc3QKaW50ZWwtZ3Z0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pbnRlbC1ndnQtZGV2
