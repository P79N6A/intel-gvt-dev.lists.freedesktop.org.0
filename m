Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a0d:d7d3:0:0:0:0:0 with SMTP id z202csp2231437ywd;
        Sun, 13 Jan 2019 09:28:17 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7hUt/X9zVQsup5N+fy1mIixN3tAM8xBb3x4dmtYH7+3UCnUKEzylbog5CyI0WpzEpYQKEr
X-Received: by 2002:a62:8893:: with SMTP id l141mr22082503pfd.1.1547400497775;
        Sun, 13 Jan 2019 09:28:17 -0800 (PST)
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [2610:10:20:722:a800:ff:fe36:1795])
        by mx.google.com with ESMTPS id p15si10016767plq.24.2019.01.13.09.28.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 13 Jan 2019 09:28:17 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) client-ip=2610:10:20:722:a800:ff:fe36:1795;
Authentication-Results: mx.google.com;
       arc=fail (body hash mismatch);
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 2610:10:20:722:a800:ff:fe36:1795 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03996E528;
	Sun, 13 Jan 2019 17:28:16 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
X-Greylist: delayed 903 seconds by postgrey-1.36 at gabe;
 Sun, 13 Jan 2019 17:28:15 UTC
Received: from sender-of-o53.zoho.com (sender-of-o53.zoho.com [135.84.80.218])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8287F6E528
 for <intel-gvt-dev@lists.freedesktop.org>;
 Sun, 13 Jan 2019 17:28:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1547399578; cv=none; d=zoho.com; s=zohoarc; 
 b=Yd5a6qNVGKILz6wLYv/aEUiGM1MpZILwOhXqwq7ze7w/Z20qfVr2OCA3jR1XjpWAWEgrReS3rKZtt/71B38B1dFmOJsP6ZhPS/b0v+aB+PG27zEJUA+Wnp8wjT0hnqrp+/NiX2FJsXCK157VS1oyM0CzJ0vSfG4h1DYJAkuMXAg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
 s=zohoarc; t=1547399578;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To:ARC-Authentication-Results;
 bh=ZmzP/VthZEK77R2KgrhWvbxx5oyY/Osvulxe+mTNQiU=; 
 b=PrZqg9FPY8z6i6WPUCG5+aXABsC17YO37gG+Tl9Itvpo52RNkliWdx5nO0aiVezuT/HZsejaMPKwPnayi92PrhapmryT0MewHaWpxMicc72pItO2A3oeNx/5Mrbre9XFURCwWNJ0kIC+3M3rbnh8/Zu4omC7gJ4jSuh2YNSvNYk=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=patchew.org;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1547399577249937.8349427064666;
 Sun, 13 Jan 2019 09:12:57 -0800 (PST)
Message-ID: <154739957604.25737.18230979149591086310@2d170d368aaa>
Subject: Re: [Qemu-devel] [PATCH 0/5] vfio/display: add edid support.
In-Reply-To: <20190111093116.17188-1-kraxel@redhat.com>
MIME-Version: 1.0
Resent-From: 
From: no-reply@patchew.org
To: kraxel@redhat.com
Date: Sun, 13 Jan 2019 09:12:57 -0800 (PST)
X-ZohoMailClient: External
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
Reply-To: qemu-devel@nongnu.org
Cc: fam@euphon.net, alex.williamson@redhat.com,
 intel-gvt-dev@lists.freedesktop.org, qemu-devel@nongnu.org, kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>
Resent-Message-Id: <20190113172816.D03996E528@gabe.freedesktop.org>
Resent-Date: Sun, 13 Jan 2019 17:28:16 +0000 (UTC)

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDE5MDExMTA5MzExNi4xNzE4
OC0xLWtyYXhlbEByZWRoYXQuY29tLwoKCgpIaSwKClRoaXMgc2VyaWVzIHNlZW1zIHRvIGhhdmUg
c29tZSBjb2Rpbmcgc3R5bGUgcHJvYmxlbXMuIFNlZSBvdXRwdXQgYmVsb3cgZm9yCm1vcmUgaW5m
b3JtYXRpb246CgpTdWJqZWN0OiBbUWVtdS1kZXZlbF0gW1BBVENIIDAvNV0gdmZpby9kaXNwbGF5
OiBhZGQgZWRpZCBzdXBwb3J0LgpUeXBlOiBzZXJpZXMKTWVzc2FnZS1pZDogMjAxOTAxMTEwOTMx
MTYuMTcxODgtMS1rcmF4ZWxAcmVkaGF0LmNvbQoKPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQoj
IS9iaW4vYmFzaApnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5yZW5hbWVsaW1pdCAwCmdpdCBjb25m
aWcgLS1sb2NhbCBkaWZmLnJlbmFtZXMgVHJ1ZQpnaXQgY29uZmlnIC0tbG9jYWwgZGlmZi5hbGdv
cml0aG0gaGlzdG9ncmFtCi4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tbWFpbGJhY2sgYmFzZS4u
Cj09PSBURVNUIFNDUklQVCBFTkQgPT09CgpVcGRhdGluZyAzYzhjZjVhOWMyMWZmODc4MjE2NGQx
ZGVmN2Y0NGJkODg4NzEzMzg0CkZyb20gaHR0cHM6Ly9naXRodWIuY29tL3BhdGNoZXctcHJvamVj
dC9xZW11CiAtIFt0YWcgdXBkYXRlXSAgICAgIHBhdGNoZXcvMjAxOTAxMTMxNDM2NDEuMzg5MzYt
MS1saWZlaTEyMTRAMTI2LmNvbSAtPiBwYXRjaGV3LzIwMTkwMTEzMTQzNjQxLjM4OTM2LTEtbGlm
ZWkxMjE0QDEyNi5jb20KU3dpdGNoZWQgdG8gYSBuZXcgYnJhbmNoICd0ZXN0JwpkM2I4M2U5IHNv
bWUgbG9nZ2luZwo0NmIzMTIzIHZmaW8vZGlzcGxheTogZGVsYXkgbGluayB1cCBldmVudAo2YWU3
NzI2IHZmaW8vZGlzcGxheTogYWRkIHhyZXMgKyB5cmVzIHByb3BlcnRpZXMKZDgyMzRmYiB2Zmlv
L2Rpc3BsYXk6IGFkZCBlZGlkIHN1cHBvcnQuCjQ1ZTFiYzEgdmZpbzogdXBkYXRlIGtlcm5lbCBo
ZWFkZXJzLgoKPT09IE9VVFBVVCBCRUdJTiA9PT0KMS81IENoZWNraW5nIGNvbW1pdCA0NWUxYmMx
NjU1MmMgKHZmaW86IHVwZGF0ZSBrZXJuZWwgaGVhZGVycy4pCjIvNSBDaGVja2luZyBjb21taXQg
ZDgyMzRmYjU3MjNjICh2ZmlvL2Rpc3BsYXk6IGFkZCBlZGlkIHN1cHBvcnQuKQpFUlJPUjogbGlu
ZSBvdmVyIDkwIGNoYXJhY3RlcnMKIzQ0OiBGSUxFOiBody92ZmlvL2Rpc3BsYXkuYzo0MDoKK3N0
YXRpYyB2b2lkIHZmaW9fZGlzcGxheV9lZGlkX3VwZGF0ZShWRklPUENJRGV2aWNlICp2ZGV2LCBi
b29sIGVuYWJsZWQsIGludCBwcmVmeCwgaW50IHByZWZ5KQoKV0FSTklORzogbGluZSBvdmVyIDgw
IGNoYXJhY3RlcnMKIzEyMjogRklMRTogaHcvdmZpby9kaXNwbGF5LmM6MTE4OgorICAgIHByZWFk
X2ZpZWxkKHZkZXYtPnZiYXNlZGV2LmZkLCBkcHktPmVkaWRfaW5mbywgZHB5LT5lZGlkX3JlZ3Ms
IGVkaWRfbWF4X3NpemUpOwoKRVJST1I6IGJyYWNlcyB7fSBhcmUgbmVjZXNzYXJ5IGZvciBhbGwg
YXJtcyBvZiB0aGlzIHN0YXRlbWVudAojMTM5OiBGSUxFOiBody92ZmlvL2Rpc3BsYXkuYzoxMzU6
CisgICAgaWYgKCFkcHktPmVkaWRfcmVncykKWy4uLl0KCnRvdGFsOiAyIGVycm9ycywgMSB3YXJu
aW5ncywgMTU2IGxpbmVzIGNoZWNrZWQKClBhdGNoIDIvNSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBs
ZWFzZSByZXZpZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMg
cmVwb3J0IHRoZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlO
RVJTLgoKMy81IENoZWNraW5nIGNvbW1pdCA2YWU3NzI2MWQ1ZjMgKHZmaW8vZGlzcGxheTogYWRk
IHhyZXMgKyB5cmVzIHByb3BlcnRpZXMpCkVSUk9SOiBicmFjZXMge30gYXJlIG5lY2Vzc2FyeSBm
b3IgYWxsIGFybXMgb2YgdGhpcyBzdGF0ZW1lbnQKIzM0OiBGSUxFOiBody92ZmlvL2Rpc3BsYXku
YzoxMjQ6CisgICAgaWYgKCF2ZGV2LT5kaXNwbGF5X3hyZXMpClsuLi5dCgpFUlJPUjogYnJhY2Vz
IHt9IGFyZSBuZWNlc3NhcnkgZm9yIGFsbCBhcm1zIG9mIHRoaXMgc3RhdGVtZW50CiMzNjogRklM
RTogaHcvdmZpby9kaXNwbGF5LmM6MTI2OgorICAgIGlmICghdmRldi0+ZGlzcGxheV95cmVzKQpb
Li4uXQoKdG90YWw6IDIgZXJyb3JzLCAwIHdhcm5pbmdzLCAzOCBsaW5lcyBjaGVja2VkCgpQYXRj
aCAzLzUgaGFzIHN0eWxlIHByb2JsZW1zLCBwbGVhc2UgcmV2aWV3LiAgSWYgYW55IG9mIHRoZXNl
IGVycm9ycwphcmUgZmFsc2UgcG9zaXRpdmVzIHJlcG9ydCB0aGVtIHRvIHRoZSBtYWludGFpbmVy
LCBzZWUKQ0hFQ0tQQVRDSCBpbiBNQUlOVEFJTkVSUy4KCjQvNSBDaGVja2luZyBjb21taXQgNDZi
MzEyMzkxYWU0ICh2ZmlvL2Rpc3BsYXk6IGRlbGF5IGxpbmsgdXAgZXZlbnQpCldBUk5JTkc6IGxp
bmUgb3ZlciA4MCBjaGFyYWN0ZXJzCiM1MTogRklMRTogaHcvdmZpby9kaXNwbGF5LmM6ODk6Cisg
ICAgdGltZXJfbW9kKGRweS0+ZWRpZF9saW5rX3RpbWVyLCBxZW11X2Nsb2NrX2dldF9tcyhRRU1V
X0NMT0NLX1JFQUxUSU1FKSArIDEwMCk7Cgp0b3RhbDogMCBlcnJvcnMsIDEgd2FybmluZ3MsIDU5
IGxpbmVzIGNoZWNrZWQKClBhdGNoIDQvNSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZp
ZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRo
ZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgo1LzUg
Q2hlY2tpbmcgY29tbWl0IGQzYjgzZTlkNzhhMSAoc29tZSBsb2dnaW5nKQpFUlJPUjogTWlzc2lu
ZyBTaWduZWQtb2ZmLWJ5OiBsaW5lKHMpCgp0b3RhbDogMSBlcnJvcnMsIDAgd2FybmluZ3MsIDQ2
IGxpbmVzIGNoZWNrZWQKClBhdGNoIDUvNSBoYXMgc3R5bGUgcHJvYmxlbXMsIHBsZWFzZSByZXZp
ZXcuICBJZiBhbnkgb2YgdGhlc2UgZXJyb3JzCmFyZSBmYWxzZSBwb3NpdGl2ZXMgcmVwb3J0IHRo
ZW0gdG8gdGhlIG1haW50YWluZXIsIHNlZQpDSEVDS1BBVENIIGluIE1BSU5UQUlORVJTLgoKPT09
IE9VVFBVVCBFTkQgPT09CgpUZXN0IGNvbW1hbmQgZXhpdGVkIHdpdGggY29kZTogMQoKClRoZSBm
dWxsIGxvZyBpcyBhdmFpbGFibGUgYXQKaHR0cDovL3BhdGNoZXcub3JnL2xvZ3MvMjAxOTAxMTEw
OTMxMTYuMTcxODgtMS1rcmF4ZWxAcmVkaGF0LmNvbS90ZXN0aW5nLmNoZWNrcGF0Y2gvP3R5cGU9
bWVzc2FnZS4KLS0tCkVtYWlsIGdlbmVyYXRlZCBhdXRvbWF0aWNhbGx5IGJ5IFBhdGNoZXcgW2h0
dHA6Ly9wYXRjaGV3Lm9yZy9dLgpQbGVhc2Ugc2VuZCB5b3VyIGZlZWRiYWNrIHRvIHBhdGNoZXct
ZGV2ZWxAcmVkaGF0LmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2ludGVsLWd2dC1kZXYK
