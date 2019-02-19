Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:3684:0:0:0:0:0 with SMTP id d126csp3031667ywa;
        Mon, 18 Feb 2019 23:48:08 -0800 (PST)
X-Google-Smtp-Source: AHgI3IaOHk/K2o/ghVPkXJCYfEXAq9f+lHRVBqbLKuYh6dUisBJSonXkOTaM7t2QPeUCy5S0FUeS
X-Received: by 2002:a62:ea09:: with SMTP id t9mr29417749pfh.228.1550562488344;
        Mon, 18 Feb 2019 23:48:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550562488; cv=none;
        d=google.com; s=arc-20160816;
        b=IAr4Ctgne7giI5mylhXAegIpUY34xYylAG7f/7LUDHZCBztYyOeEaMOHm4L2VfMJFN
         QAD8nweTLM4jPwK1JQPx6QvWBCpQjOR4GOFbRrxpXnslXj5+hzLxFAhhvIgMpZUVf0IK
         mIQAg9MDbpcCYaz7vtJJi/oi2yzo/43cIVQPiZn/deMpaZO5dHSep4ADgq324bhRevUt
         lrBZoTGg/PL2RRshLpQXB1libXWc82hHZ/gvkeAlyEL4j3+EWpJ1RF4wa56mMRB10m1h
         C8IYWDkWc7KRTFM66OcGt+QEX0d7NVj1MWgx7gI5hM7X8jORGBLYm18YG5fBAS4p1+M/
         1ePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:mime-version:cc
         :list-subscribe:list-help:list-post:list-archive:list-unsubscribe
         :list-id:precedence:message-id:date:subject:to:from:delivered-to;
        bh=I527qTPBskpGXhpyJxppwwcT26LYaCiZcqYcTq6SvJI=;
        b=T4mD5YbPUSQa6/6VtGonibcJX4RVi9db+cXBZKXnuBod1U6inKEzmhks/QOsk6Bq7F
         hbN7fXdG2RND36Nwi4jAR7UxBOVw4jdVUlbv06Wp6KbjgmcvZ0I3gk7DilPRLtR0airz
         FPoOtvQdINXSP5/RHUxgUVHU01IFXLFbHGo9YAEafTcmFwOkkTdq5O4QpHCPhaxKtPjH
         gcmWh+w++srDrAnIw6lVMMZiVfLo0MUXWKkm5KCpdcG79GUSi1d0ZueIaihMWVnJaMjf
         0tbdto5GspSmVy9V00P7BbAi2ETKHTfGSL5mHTCSnSZDWJ9CONcA6RAYjhOhZulVIuv6
         Y4PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id v9si13996292pgb.170.2019.02.18.23.48.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 23:48:08 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC26A89259;
	Tue, 19 Feb 2019 07:48:07 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8694089248
 for <intel-gvt-dev@lists.freedesktop.org>;
 Tue, 19 Feb 2019 07:48:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2019 23:48:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,387,1544515200"; d="scan'208";a="144620270"
Received: from joy-optiplex-7040.sh.intel.com ([10.239.13.9])
 by fmsmga002.fm.intel.com with ESMTP; 18 Feb 2019 23:48:02 -0800
From: Yan Zhao <yan.y.zhao@intel.com>
To: intel-gvt-dev@lists.freedesktop.org,
	alex.williamson@redhat.com
Subject: [PATCH 0/8] VFIO Device states interface in GVT
Date: Tue, 19 Feb 2019 02:42:42 -0500
Message-Id: <20190219074242.14015-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Yan Zhao <yan.y.zhao@intel.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaHNldCBwcm92aWRlcyBHVlQgdkdQVSB3aXRoIGRldmljZSBzdGF0ZXMgY29udHJv
bCBhbmQKaW50ZXJmYWNlcyB0byBnZXQvc2V0IGRldmljZSBkYXRhLgoKCkRlc2dpbiBvZiBkZXZp
Y2Ugc3RhdGUgY29udHJvbCBhbmQgaW50ZXJmYWNlcyB0byBnZXQvc2V0IGRldmljZSBkYXRhCj09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09CgpDT0RFIFNUUlVDVFVSRVMKLS0tLS0tLS0tLS0tLS0tCi8qIERldmljZSBTdGF0
ZSByZWdpb24gdHlwZSBhbmQgc3ViLXR5cGUgKi8KI2RlZmluZSBWRklPX1JFR0lPTl9UWVBFX0RF
VklDRV9TVEFURSAgICAgICAgICAgKDEgPDwgMSkKI2RlZmluZSBWRklPX1JFR0lPTl9TVUJUWVBF
X0RFVklDRV9TVEFURV9DVEwgICAgICAgKDEpCiNkZWZpbmUgVkZJT19SRUdJT05fU1VCVFlQRV9E
RVZJQ0VfU1RBVEVfREFUQV9DT05GSUcgICAgICAoMikKI2RlZmluZSBWRklPX1JFR0lPTl9TVUJU
WVBFX0RFVklDRV9TVEFURV9EQVRBX01FTU9SWSAgICAgICgzKQojZGVmaW5lIFZGSU9fUkVHSU9O
X1NVQlRZUEVfREVWSUNFX1NUQVRFX0RBVEFfRElSVFlCSVRNQVAgKDQpCgojZGVmaW5lIFZGSU9f
REVWSUNFX1NUQVRFX0lOVEVSRkFDRV9WRVJTSU9OIDEKI2RlZmluZSBWRklPX0RFVklDRV9EQVRB
X0NBUF9ERVZJQ0VfTUVNT1JZIDEKI2RlZmluZSBWRklPX0RFVklDRV9EQVRBX0NBUF9TWVNURU1f
TUVNT1JZIDIKCiNkZWZpbmUgVkZJT19ERVZJQ0VfU1RBVEVfUlVOTklORyAwIAojZGVmaW5lIFZG
SU9fREVWSUNFX1NUQVRFX1NUT1AgMQojZGVmaW5lIFZGSU9fREVWSUNFX1NUQVRFX0xPR0dJTkcg
MgoKI2RlZmluZSBWRklPX0RFVklDRV9EQVRBX0FDVElPTl9HRVRfQlVGRkVSIDEKI2RlZmluZSBW
RklPX0RFVklDRV9EQVRBX0FDVElPTl9TRVRfQlVGRkVSIDIKCnN0cnVjdCB2ZmlvX2RldmljZV9z
dGF0ZV9jdGwgewoJX191MzIgdmVyc2lvbjsJICAvKiBybywgdmVyc2lvbiBvZiBkZXZpY2UgY29u
dHJvbCBpbnRlcmZhY2UqLwoJX191MzIgZGV2aWNlX3N0YXRlOyAgICAgICAvKiBWRklPIGRldmlj
ZSBzdGF0ZSwgd28gKi8KCV9fdTMyIGNhcHM7CQkgLyogcm8gKi8KICAgICAgICBzdHJ1Y3QgewoJ
CV9fdTMyIGFjdGlvbjsgIC8qIHdvLCBHRVRfQlVGRkVSIG9yIFNFVF9CVUZGRVIgKi8gCgkJX191
NjQgc2l6ZTsgICAgLypydywgdG90YWwgc2l6ZSBvZiBkZXZpY2UgY29uZmlnKi8KCX0gZGV2aWNl
X2NvbmZpZzsKCXN0cnVjdCB7CgkJX191MzIgYWN0aW9uOyAgICAvKiB3bywgR0VUX0JVRkZFUiBv
ciBTRVRfQlVGRkVSICovIAoJCV9fdTY0IHNpemU7ICAgICAvKiBydywgdG90YWwgc2l6ZSBvZiBk
ZXZpY2UgbWVtb3J5Ki8gIAogICAgICAgICAgICAgICAgX191NjQgcG9zOy8qY2h1bmsgb2Zmc2V0
IGluIHRvdGFsIGJ1ZmZlciBvZiBkZXZpY2UgbWVtb3J5Ki8KCX0gZGV2aWNlX21lbW9yeTsKCXN0
cnVjdCB7CgkJX191NjQgc3RhcnRfYWRkcjsgLyogd28gKi8KCQlfX3U2NCBwYWdlX25yOyAgIC8q
IHdvICovCgl9IHN5c3RlbV9tZW1vcnk7Cn07CgpERVZJQ0UgREFUQQotLS0tLS0tLS0tLQpBIFZG
SU8gZGV2aWNlJ3MgZGF0YSBjYW4gYmUgZGl2aWRlZCBpbnRvIDMgY2F0ZWdvcmllczogZGV2aWNl
IGNvbmZpZywKZGV2aWNlIG1lbW9yeSBhbmQgc3lzdGVtIG1lbW9yeSBkaXJ0eSBwYWdlcy4KCkRl
dmljZSBDb25maWc6IHN1Y2gga2luZCBvZiBkYXRhIGxpa2UgTU1JT3MsIHBhZ2UgdGFibGVzLi4u
CiAgICAgICAgICAgICAgIEV2ZXJ5IGRldmljZSBpcyBzdXBwb3NlZCB0byBwb3NzZXNzIGRldmlj
ZSBjb25maWcgZGF0YS4KICAgICAgICAgICAgICAgVXN1YWxseSB0aGUgc2l6ZSBvZiBkZXZpY2Ug
Y29uZmlnIGRhdGEgaXMgc21hbGwgKG5vIGJpZwogICAgICAgICAgICAgICB0aGFuIDEwTSksIGFu
ZCBpdCBuZWVkcyB0byBiZSBsb2FkZWQgaW4gY2VydGFpbiBzdHJpY3QKICAgICAgICAgICAgICAg
b3JkZXIuCiAgICAgICAgICAgICAgIFRoZXJlZm9yZSBubyBkaXJ0eSBkYXRhIGxvZ2dpbmcgaXMg
ZW5hYmxlZCBmb3IgZGV2aWNlCiAgICAgICAgICAgICAgIGNvbmZpZyBhbmQgaXQgbXVzdCBiZSBn
b3Qvc2V0IGFzIGEgd2hvbGUuCgpEZXZpY2UgTWVtb3J5OiBkZXZpY2UncyBpbnRlcm5hbCBtZW1v
cnksIHN0YW5kYWxvbmUgYW5kIG91dHNpZGUgc3lzdGVtCiAgICAgICAgICAgICAgIG1lbW9yeS4g
IEl0IGlzIHVzdWFsbHkgdmVyeSBiaWcuCiAgICAgICAgICAgICAgIE5vdCBhbGwgZGV2aWNlIGhh
cyBkZXZpY2UgbWVtb3J5LiBMaWtlIElHRCBvbmx5IHVzZXMgc3lzdGVtCiAgICAgICAgICAgICAg
IG1lbW9yeSBhbmQgaGFzIG5vIGRldmljZSBtZW1vcnkuCgpTeXN0ZW0gTWVtb3J5IERpcnR5IFBh
Z2VzOiBBIGRldmljZSBjYW4gcHJvZHVjZSBkaXJ0eSBwYWdlcyBpbiBzeXN0ZW0KICAgICAgICAg
ICAgICAgbWVtb3J5LiAKCgpERVZJQ0UgU1RBVEUgUkVHSU9OUwotLS0tLS0tLS0tLS0tLS0tLS0t
LS0KQSBWRklPIGRldmljZSBkcml2ZXIgbmVlZHMgdG8gcmVnaXN0ZXIgdHdvIG1hbmRhdG9yeSBy
ZWdpb25zIGFuZCBvcHRpb25hbGx5CmFub3RoZXIgdHdvIHJlZ2lvbnMgaWYgaXQgcGxhbnMgdG8g
c3VwcG9ydCBkZXZpY2Ugc3RhdGUgbWFuYWdlbWVudC4KClNvLCB0aGVyZSBhcmUgdXAgdG8gZm91
ciByZWdpb25zIGluIHRvdGFsLgpvbmUgaXMgY29udHJvbCByZWdpb24gKHJlZ2lvbiBDVEwpIHdo
aWNoIGlzIGFjY2Vzc2VkIHZpYSByZWFkL3dyaXRlIHN5c3RlbQpjYWxsIGZyb20gdXNlciBzcGFj
ZTsKdGhlIGxlZnQgdGhyZWUgYXJlIGRhdGEgcmVnaW9ucyB3aGljaCBhcmUgbW1hcGVkIGludG8g
dXNlciBzcGFjZSBhbmQgY2FuIGJlCmFjY2Vzc2VkIGluIHRoZSBzYW1lIHdheSBhcyBhY2Nlc3Np
bmcgbWVtb3J5IGZyb20gdXNlciBzcGFjZS4KKElmIGRhdGEgcmVnaW9ucyBmYWlsZWQgdG8gYmUg
bW1hcGVkIGludG8gdXNlciBzcGFjZSwgdGhlIHdheSBvZiByZWFkL3dyaXRlCnN5c3RlbSBjYWxs
cyBmcm9tIHVzZXIgc3BhY2UgaXMgYWxzbyB2YWxpZCkuCgoxLiByZWdpb24gQ1RMOgogICAgICAg
ICAgTWFuZGF0b3J5LgogICAgICAgICAgVGhpcyBpcyBhIGNvbnRyb2wgcmVnaW9uLgogICAgICAg
ICAgSXRzIGxheW91dCBpcyBkZWZpbmVkIGluIHN0cnVjdCB2ZmlvX2RldmljZV9zdGF0ZV9jdGwu
CiAgICAgICAgICBSZWFkaW5nIGZyb20gdGhpcyByZWdpb24gY2FuIGdldCB2ZXJzaW9uLCBjYXBh
YmlsaXRpZXMgYW5kIGRhdGEKICAgICAgICAgIHNpemUgb2YgZGV2aWNlIHN0YXRlIGludGVyZmFj
ZXMuCiAgICAgICAgICBXcml0aW5nIHRvIHRoaXMgcmVnaW9uIGNhbiBzZXQgZGV2aWNlIHN0YXRl
LCBkYXRhIHNpemUgYW5kCiAgICAgICAgICBjaG9vc2Ugd2hpY2ggaW50ZXJmYWNlIHRvIHVzZSwg
aS5lLCBhbW9uZwogICAgICAgICAgImdldCBkZXZpY2UgY29uZmlnIGJ1ZmZlciIsICJzZXQgZGV2
aWNlIGNvbmZpZyBidWZmZXIiLAogICAgICAgICAgImdldCBkZXZpY2UgbWVtb3J5IGJ1ZmZlciIs
ICJzZXQgZGV2aWNlIG1lbW9yeSBidWZmZXIiLAogICAgICAgICAgImdldCBzeXN0ZW0gbWVtb3J5
IGRpcnR5IGJpdG1hcCIuIAoyLiByZWdpb24gREVWSUNFX0NPTkZJRwogICAgICAgICAgTWFuZGF0
b3J5LgogICAgICAgICAgVGhpcyBpcyBhIGRhdGEgcmVnaW9uIHRoYXQgaG9sZHMgZGV2aWNlIGNv
bmZpZyBkYXRhLgogICAgICAgICAgSXQgaXMgYWJsZSB0byBiZSBtbWFwZWQgaW50byB1c2VyIHNw
YWNlLgozLiByZWdpb24gREVWSUNFX01FTU9SWQogICAgICAgICAgT3B0aW9uYWwuCiAgICAgICAg
ICBUaGlzIGlzIGEgZGF0YSByZWdpb24gdGhhdCBob2xkcyBkZXZpY2UgbWVtb3J5IGRhdGEuCiAg
ICAgICAgICBJdCBpcyBhYmxlIHRvIGJlIG1tYXBlZCBpbnRvIHVzZXIgc3BhY2UuCjQuIHJlZ2lv
biBESVJUWV9CSVRNQVAKICAgICAgICAgIE9wdGlvbmFsLgogICAgICAgICAgVGhpcyBpcyBhIGRh
dGEgcmVnaW9uIHRoYXQgaG9sZHMgYml0bWFwIG9mIGRpcnR5IHBhZ2VzIGluIHN5c3RlbQogICAg
ICAgICAgbWVtb3J5IHRoYXQgYSBWRklPIGRldmljZXMgcHJvZHVjZXMuCiAgICAgICAgICBJdCBp
cyBhYmxlIHRvIGJlIG1tYXBlZCBpbnRvIHVzZXIgc3BhY2UuCgoKREVWSUNFIFNUQVRFUwotLS0t
LS0tLS0tLS0tCkZvdXIgc3RhdGVzIGFyZSBkZWZpbmVkIGZvciBhIFZGSU8gZGV2aWNlOgogICAg
ICAgIFJVTk5JTkcsIFJVTk5JTkcgJiBMT0dHSU5HLCBTVE9QICYgTE9HR0lORywgU1RPUC4KVGhl
eSBjYW4gYmUgc2V0IGJ5IHdyaXRpbmcgdG8gZGV2aWNlX3N0YXRlIGZpZWxkIG9mIHZmaW9fZGV2
aWNlX3N0YXRlX2N0bApyZWdpb24uCgpMT0dHSU5HIHN0YXRlIGlzIGEgc3BlY2lhbCBzdGF0ZSB0
aGF0IGl0IENBTk5PVCBleGlzdCBpbmRlcGVuZGVudGx5LgpJdCBtdXN0IGJlIHNldCBhbG9uZ3Np
ZGUgd2l0aCBzdGF0ZSBSVU5OSU5HIG9yIFNUT1AsIGkuZSwgCiAgICAgICAgUlVOTklORyAmIExP
R0dJTkcsIFNUT1AgJiBMT0dHSU5HCgpJdCBpcyB1c2VkIGZvciBkaXJ0eSBkYXRhIGxvZ2dpbmcg
Ym90aCBmb3IgZGV2aWNlIG1lbW9yeSBhbmQgc3lzdGVtIG1lbW9yeS4KCkxPR0dJTkcgb25seSBp
bXBhY3RzIGRldmljZS9zeXN0ZW0gbWVtb3J5LgpEZXZpY2UgY29uZmlnIHNob3VsZCBiZSBhbHdh
eXMgYWNjZXNzaWJsZSBhbmQgcmV0dXJuIHdob2xlIGNvbmZpZyBzbmFwc2hvdApyZWdhcmRsZXNz
IG9mIExPR0dJTkcgc3RhdGUuCgpUeXBpY2FsIHN0YXRlIHRyYW5zaXRpb24gZmxvd3MgZm9yIFZG
SU8gZGV2aWNlcyBhcmU6CiAgICAoYSkgUlVOTklORyAtLT4gUlVOTklORyAmIExPR0dJTkcgLS0+
IFNUT1AgJiBMT0dHSU5HIC0tPiBTVE9QCiAgICAoYikgUlVOTklORyAtLT4gU1RPUCAtLT4gUlVO
TklORwoKUlVOTklORzogSW4gdGhpcyBzdGF0ZSwgYSBWRklPIGRldmljZSBpcyBpbiBhY3RpdmUg
c3RhdGUgcmVhZHkgdG8gcmVjZWl2ZQogICAgICAgICBjb21tYW5kcyBmcm9tIGRldmljZSBkcml2
ZXIuCiAgICAgICAgIGludGVyZmFjZXMgaW5jbHVkZXMgImdldCBkZXZpY2UgY29uZmlnIGJ1ZmZl
ciIsICJnZXQgZGV2aWNlIGNvbmZpZwogICAgICAgICBzaXplIiwgImdldCBkZXZpY2UgbWVtb3J5
IGJ1ZmZlciIsICJnZXQgZGV2aWNlIG1lbW9yeSBzaXplIgogICAgICAgICByZXR1cm4gd2hvbGUg
ZGF0YSBzbmFwc2hvdC4KICAgICAgICAgImdldCBzeXN0ZW0gbWVtb3J5IGRpcnR5IGJpdG1hcCIg
cmV0dXJucyBlbXB0eSBiaXRtYXAuCiAgICAgICAgIEl0IGlzIHRoZSBkZWZhdWx0IHN0YXRlIHRo
YXQgYSBWRklPIGRldmljZSBlbnRlcnMgaW5pdGlhbGx5LgoKU1RPUDoJIEluIHRoaXMgc3RhdGUs
IGEgVkZJTyBkZXZpY2UgaXMgZGVhY3RpdmF0ZWQgdG8gaW50ZXJhY3Qgd2l0aAogICAgICAgICBk
ZXZpY2UgZHJpdmVyLgogICAgICAgICAiZ2V0IGRldmljZSBjb25maWcgYnVmZmVyIiwgImdldCBk
ZXZpY2UgY29uZmlnIHNpemUiCiAgICAgICAgICJnZXQgZGV2aWNlIG1lbW9yeSBidWZmZXIiLCAi
Z2V0IGRldmljZSBtZW1vcnkgc2l6ZSIsCiAgICAgICAgICByZXR1cm4gd2hvbGUgZGF0YSBzbmFw
c2hvdC4KICAgICAgICAgImdldCBzeXN0ZW0gbWVtb3J5IGRpcnR5IGJpdG1hcCIgcmV0dXJucyBl
bXB0eSBiaXRtYXAuCgpSVU5OSU5HICYgTE9HR0lORzogSW4gdGhpcyBzdGF0ZSwgYSBWRklPIGRl
dmljZSBpcyBpbiBhY3RpdmUgc3RhdGUuCiAgICAgICAgICJnZXQgZGV2aWNlIGNvbmZpZyBidWZm
ZXIiLCAiZ2V0IGRldmljZSBjb25maWcgc2l6ZSIgcmV0dXJucyB3aG9sZQogICAgICAgICBzbmFw
c2hvdCBvZiBkZXZpY2UgY29uZmlnLiAKICAgICAgICAgImdldCBkZXZpY2UgbWVtb3J5IGJ1ZmZl
ciIsICJnZXQgZGV2aWNlIG1lbW9yeSBzaXplIiwgImdldCBzeXN0ZW0KICAgICAgICAgbWVtb3J5
IGRpcnR5IGJpdG1hcCIgcmV0dXJucyBkaXJ0eSBkYXRhIHNpbmNlIGxhc3QgY2FsbCB0byB0aG9z
ZQogICAgICAgICBpbnRlcmZhY2VzLgoKU1RPUCAmIExPR0dJTkc6IEluIHRoaXMgc3RhdGUsIHRo
ZSBWRklPIGRldmljZSBpcyBkZWFjdGl2YXRlZC4KICAgICAgICAgImdldCBkZXZpY2UgY29uZmln
IGJ1ZmZlciIsICJnZXQgZGV2aWNlIGNvbmZpZyBzaXplIiByZXR1cm5zIHdob2xlCiAgICAgICAg
IHNuYXBzaG90IG9mIGRldmljZSBjb25maWcuIAogICAgICAgICAiZ2V0IGRldmljZSBtZW1vcnkg
YnVmZmVyIiwgImdldCBkZXZpY2UgbWVtb3J5IHNpemUiLCAiZ2V0IHN5c3RlbQogICAgICAgICBt
ZW1vcnkgZGlydHkgYml0bWFwIiByZXR1cm5zIGRpcnR5IGRhdGEgc2luY2UgbGFzdCBjYWxsIHRv
IHRob3NlCiAgICAgICAgIGludGVyZmFjZXMuCgpOb3RlOgpUaGUgcmVhc29uIHdoeSBSVU5OSU5H
IGlzIHRoZSBkZWZhdWx0IHN0YXRlIGlzIHRoYXQgZGV2aWNlJ3MgYWN0aXZlIHN0YXRlCm11c3Qg
bm90IGRlcGVuZCBvbiBkZXZpY2Ugc3RhdGUgaW50ZXJmYWNlLgpJdCBpcyBwb3NzaWJsZSB0aGF0
IHJlZ2lvbiB2ZmlvX2RldmljZV9zdGF0ZV9jdGwgZmFpbHMgdG8gZ290IHJlZ2lzdGVyZWQuCklu
IHRoYXQgY29uZGl0aW9uLCBhIGRldmljZSBuZWVkcyBiZSBpbiBhY3RpdmUgc3RhdGUgYnkgZGVm
YXVsdC4gCgoKREVWSUNFIERBVEEgQ0FQUwotLS0tLS0tLS0tLS0tLS0tLS0KRGV2aWNlIENvbmZp
ZyBjYXBhYmlsaXR5IGlzIGJ5IGRlZmF1bHQgb24sIG5vIG5lZWQgdG8gc2V0IHRoaXMgY2FwLgoK
Rm9yIGRldmljZXMgdGhhdCBoYXZlIGRldmNpZSBtZW1vcnksIGl0IGlzIHJlcXVpcmVkIHRvIGV4
cG9zZSBERVZJQ0VfTUVNT1JZCmNhcGFiaWxpdHkuCiNkZWZpbmUgVkZJT19ERVZJQ0VfREFUQV9D
QVBfREVWSUNFX01FTU9SWSAxCgpGb3IgZGV2aWNlcyBwcm9kdWNpbmcgZGlydHkgcGFnZXMgaW4g
c3lzdGVtIG1lbW9yeSwgaXQgaXMgcmVxdWlyZWQgdG8KZXhwb3NlIGNhcCBTWVNURU1fTUVNT1JZ
IGluIG9yZGVyIHRvIGdldCBkaXJ0eSBiaXRtYXAgaW4gY2VydGFpbiByYW5nZSBvZgpzeXN0ZW0g
bWVtb3J5LgojZGVmaW5lIFZGSU9fREVWSUNFX0RBVEFfQ0FQX1NZU1RFTV9NRU1PUlkgMgoKc2Vl
IHNlY3Rpb24gIkRFVklDRSBTVEFURSBJTlRFUkZBQ0UiIGZvciAiZ2V0IGNhcHMiIGludGVyZmFj
ZSB0byBnZXQgZGV2aWNlCmRhdGEgY2FwcyBmcm9tIHVzZXJzcGFjZSBWRklPLgoKCkRFVklDRSBT
VEFURSBJTlRFUkZBQ0VTCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoxLiBnZXQgdmVyc2lvbgog
ICAoMSkgdXNlciBzcGFjZSBjYWxscyByZWFkIHN5c3RlbSBjYWxsIG9uICJ2ZXJzaW9uIiBmaWVs
ZCBvZiByZWdpb24gQ1RMLgogICAoMikgVkZJTyBkcml2ZXIgd3JpdGVzIHZlcnNpb24gbnVtYmVy
IG9mIGRldmljZSBzdGF0ZSBpbnRlcmZhY2VzIHRvIHRoZQogICAgICAgInZlcnNpb24iIGZpZWxk
IG9mIHJlZ2lvbiBDVEwuCgoyLiBnZXQgY2FwcwogICAoMSkgdXNlciBzcGFjZSBjYWxscyByZWFk
IHN5c3RlbSBjYWxsIG9uICJjYXBzIiBmaWVsZCBvZiByZWdpb24gQ1RMLgogICAoMikgaWYgYSBW
RklPIGRldmljZSBoYXMgaHVnZSBkZXZpY2UgbWVtb3J5LCBWRklPIGRyaXZlciByZXBvcnRzCiAg
ICAgICBWRklPX0RFVklDRV9EQVRBX0NBUF9ERVZJQ0VfTUVNT1JZIGluICJjYXBzIiBmaWVsZCBv
ZiByZWdpb24gQ1RMLgogICAgICAgaWYgYSBWRklPIGRldmljZSBwcm9kdWNlcyBkaXJ0eSBwYWdl
cyBpbiBzeXN0ZW0gbWVtb3J5LCBWRklPIGRyaXZlcgogICAgICAgcmVwb3J0cyBWRklPX0RFVklD
RV9EQVRBX0NBUF9TWVNURU1fTUVNT1JZIGluICJjYXBzIiBmaWVsZCBvZgogICAgICAgcmVnaW9u
IENUTC4KCjMuIHNldCBkZXZpY2Ugc3RhdGUKICAgKDEpIHVzZXIgc3BhY2UgY2FsbHMgd3JpdGUg
c3lzdGVtIGNhbGwgb24gImRldmljZV9zdGF0ZSIgZmllbGQgb2YgcmVnaW9uCiAgICAgICBDVEwu
CiAgICgyKSBkZXZpY2Ugc3RhdGUgdHJhbnNpdGlvbnMgYXM6CgogICAgICAgUlVOTklORyAtLSBz
dGFydCBkaXJ0eSBkYXRhIGxvZ2dpbmcgLS0+IFJVTk5JTkcgJiBMT0dHSU5HIAogICAgICAgUlVO
TklORyAtLSBkZWFjdGl2YXRlIC0tPiBTVE9QCiAgICAgICBSVU5OSU5HIC0tIGRlYWN0aXZhdGUg
JiBzdGFydCBkaXJ0eSBkYXRhIGxvbmdnaW5nIC0tPiBTVE9QICYgTE9HR0lORwogICAgICAgUlVO
TklORyAmIExPR0dJTkcgLS0gc3RvcCBkaXJ0eSBkYXRhIGxvZ2dpbmcgLS0+IFJVTk5JTkcKICAg
ICAgIFJVTk5JTkcgJiBMT0dHSU5HIC0tIGRlYWN0aXZhdGUgLS0+IFNUT1AgJiBMT0dHSU5HCiAg
ICAgICBSVU5OSU5HICYgTE9HR0lORyAtLSBkZWFjdGl2YXRlICYgc3RvcCBkaXJ0eSBkYXRhIGxv
Z2dpbmcgLS0+IFNUT1AKICAgICAgIFNUT1AgLS0gYWN0aXZhdGUgLS0+IFJVTk5JTkcKICAgICAg
IFNUT1AgLS0gc3RhcnQgZGlydHkgZGF0YSBsb2dnaW5nIC0tPiBTVE9QICYgTE9HR0lORwogICAg
ICAgU1RPUCAtLSBhY3RpdmF0ZSAmIHN0YXJ0IGRpcnR5IGRhdGEgbG9nZ2luZyAtLT4gUlVOTklO
RyAmIExPR0dJTkcKICAgICAgIFNUT1AgJiBMT0dHSU5HIC0tIHN0b3AgZGlydHkgZGF0YSBsb2dn
aW5nIC0tPiBTVE9QCiAgICAgICBTVE9QICYgTE9HR0lORyAtLSBhY3RpdmF0ZSAtLT4gUlVOTklO
RyAmIExPR0dJTkcKICAgICAgIFNUT1AgJiBMT0dHSU5HIC0tIGFjdGl2YXRlICYgc3RvcCBkaXJ0
eSBkYXRhIGxvZ2dpbmcgLS0+IFJVTk5JTkcKCjQuIGdldCBkZXZpY2UgY29uZmlnIHNpemUKICAg
KDEpIHVzZXIgc3BhY2UgY2FsbHMgcmVhZCBzeXN0ZW0gY2FsbCBvbiAiZGV2aWNlX2NvbmZpZy5z
aXplIiBmaWVsZCBvZgogICAgICAgcmVnaW9uIENUTCBmb3IgdGhlIHRvdGFsIHNpemUgb2YgZGV2
aWNlIGNvbmZpZyBzbmFwc2hvdC4KICAgKDIpIFZGSU8gZHJpdmVyIHdyaXRlcyBkZXZpY2UgY29u
ZmlnIGRhdGEncyB0b3RhbCBzaXplIGluCiAgICAgICAiZGV2aWNlX2NvbmZpZy5zaXplIiBmaWVs
ZCBvZiByZWdpb24gQ1RMLgoKNS4gc2V0IGRldmljZSBjb25maWcgc2l6ZQogICAoMSkgdXNlciBz
cGFjZSBjYWxscyB3cml0ZSBzeXN0ZW0gY2FsbC4KICAgICAgIHRvdGFsIHNpemUgb2YgZGV2aWNl
IGNvbmZpZyBzbmFwc2hvdCAtLT4gImRldmljZV9jb25maWcuc2l6ZSIgZmllbGQKICAgICAgIG9m
IHJlZ2lvbiBDVEwuCiAgICgyKSBWRklPIGRyaXZlciByZWFkcyBkZXZpY2UgY29uZmlnIGRhdGEn
cyB0b3RhbCBzaXplIGZyb20KICAgICAgICJkZXZpY2VfY29uZmlnLnNpemUiIGZpZWxkIG9mIHJl
Z2lvbiBDVEwuCgo2IGdldCBkZXZpY2UgY29uZmlnIGJ1ZmZlcgogICAoMSkgdXNlciBzcGFjZSBj
YWxscyB3cml0ZSBzeXN0ZW0gY2FsbC4KICAgICAgICJHRVRfQlVGRkVSIiAtLT4gImRldmljZV9j
b25maWcuYWN0aW9uIiBmaWVsZCBvZiByZWdpb24gQ1RMLgogICAoMikgVkZJTyBkcml2ZXIKICAg
ICAgIGEuIGdldHMgd2hvbGUgc25hcHNob3QgZm9yIGRldmljZSBjb25maWcgCiAgICAgICBiLiB3
cml0ZXMgd2hvbGUgZGV2aWNlIGNvbmZpZyBzbmFwc2hvdCB0byByZWdpb24KICAgICAgIERFVklD
RV9DT05GSUcuCiAgICgzKSB1c2VyIHNwYWNlIHJlYWRzIHRoZSB3aG9sZSBvZiBkZXZpY2UgY29u
ZmlnIHNuYXBzaG90IGZyb20gcmVnaW9uCiAgICAgICBERVZJQ0VfQ09ORklHLgogCjcuIHNldCBk
ZXZpY2UgY29uZmlnIGJ1ZmZlcgogICAoMSkgdXNlciBzcGFjZSB3cml0ZXMgd2hvbGUgb2YgZGV2
aWNlIGNvbmZpZyBkYXRhIHRvIHJlZ2lvbgogICAgICAgREVWSUNFX0NPTkZJRy4KICAgKDIpIHVz
ZXIgc3BhY2UgY2FsbHMgd3JpdGUgc3lzdGVtIGNhbGwuCiAgICAgICAiU0VUX0JVRkZFUiIgLS0+
ICJkZXZpY2VfY29uZmlnLmFjdGlvbiIgZmllbGQgb2YgcmVnaW9uIENUTC4KICAgKDMpIFZGSU8g
ZHJpdmVyIGxvYWRzIHdob2xlIG9mIGRldmljZSBjb25maWcgZnJvbSByZWdpb24gREVWSUNFX0NP
TkZJRy4KCjguIGdldCBkZXZpY2UgbWVtb3J5IHNpemUKICAgKDEpIHVzZXIgc3BhY2UgY2FsbHMg
cmVhZCBzeXN0ZW0gY2FsbCBvbiAiZGV2aWNlX21lbW9yeS5zaXplIiBmaWVsZCBvZgogICAgICAg
cmVnaW9uIENUTCBmb3IgZGV2aWNlIG1lbW9yeSBzaXplLgogICAoMikgVkZJTyBkcml2ZXIKICAg
ICAgIGEuIGdldHMgZGV2aWNlIG1lbW9yeSBzbmFwc2hvdCAoaW4gc3RhdGUgUlVOTklORyBvciBT
VE9QKSwgb3IKICAgICAgICAgIGdldHMgZGV2aWNlIG1lbW9yeSBkaXJ0eSBkYXRhIChpbiBzdGF0
ZSBSVU5OSU5HICYgTE9HR0lORyBvcgogICAgICAgICAgc3RhdGUgU1RPUCAmIExPR0dJTkcpCiAg
ICAgICBiLiB3cml0ZXMgc2l6ZSBpbiAiZGV2aWNlX21lbW9yeS5zaXplIiBmaWVsZCBvZiByZWdp
b24gQ1RMCiAKOS4gc2V0IGRldmljZSBtZW1vcnkgc2l6ZQogICAoMSkgdXNlciBzcGFjZSBjYWxs
cyB3cml0ZSBzeXN0ZW0gY2FsbCBvbiAiZGV2aWNlX21lbW9yeS5zaXplIiBmaWVsZCBvZgogICAg
ICAgcmVnaW9uIENUTCB0byBzZXQgdG90YWwgc2l6ZSBvZiBkZXZpY2UgbWVtb3J5IHNuYXBzaG90
LgogICAoMikgVkZJTyBkcml2ZXIgcmVhZHMgZGV2aWNlIG1lbW9yeSdzIHNpemUgZnJvbSAiZGV2
aWNlX21lbW9yeS5zaXplIgogICAgICAgZmllbGQgb2YgcmVnaW9uIENUTC4KCgoxMC4gZ2V0IGRl
dmljZSBtZW1vcnkgYnVmZmVyCiAgICgxKSB1c2VyIHNwYWNlIGNhbGxzIHdyaXRlIHN5c3RlbS4K
ICAgICAgIHBvcyAtLT4gImRldmljZV9tZW1vcnkucG9zIiBmaWVsZCBvZiByZWdpb24gQ1RMLAog
ICAgICAgIkdFVF9CVUZGRVIiIC0tPiAiZGV2aWNlX21lbW9yeS5hY3Rpb24iIGZpZWxkIG9mIHJl
Z2lvbiBDVEwuCiAgICAgICAocG9zIG11c3QgYmUgMCBvciBtdWx0aXBsZXMgb2YgbGVuZ3RoIG9m
IHJlZ2lvbiBERVZJQ0VfTUVNT1JZKS4KICAgKDIpIFZGSU8gZHJpdmVyIHdyaXRlcyBOJ3RoIGNo
dW5rIG9mIGRldmljZSBtZW1vcnkgc25hcHNob3QvZGlydHkgZGF0YQogICAgICAgdG8gcmVnaW9u
IERFVklDRV9NRU1PUlkuCiAgICAgICAoTiBlcXVhbHMgdG8gcG9zLyhyZWdpb24gbGVuZ3RoIG9m
IERFVklDRV9NRU1PUlkpKQogICAoMykgdXNlciBzcGFjZSByZWFkcyB0aGUgTid0aCBjaHVuayBv
ZiBkZXZpY2UgbWVtb3J5IHNuYXBzaG90L2RpcnR5IGRhdGEKICAgICAgIGZyb20gcmVnaW9uIERF
VklDRV9NRU1PUlkuCiAKMTEuIHNldCBkZXZpY2UgbWVtb3J5IGJ1ZmZlcgogICAoMSkgdXNlciBz
cGFjZSB3cml0ZXMgTid0aCBjaHVuayBvZiBkZXZpY2UgbWVtb3J5IHNuYXBzaG90L2RpcnR5IGRh
dGEgdG8KICAgICAgIHJlZ2lvbiBERVZJQ0VfTUVNT1JZLgogICAgICAgKE4gZXF1YWxzIHRvIHBv
cy8ocmVnaW9uIGxlbmd0aCBvZiBERVZJQ0VfTUVNT1JZKSkKICAgKDIpIHVzZXIgc3BhY2Ugd3Jp
dGVzIHBvcyB0byAiZGV2aWNlX21lbW9yeS5wb3MiIGZpZWxkIGFuZCB3cml0ZXMKICAgICAgICJT
RVRfQlVGRkVSIiB0byAiZGV2aWNlX21lbW9yeS5hY3Rpb24iIGZpZWxkIG9mIHJlZ2lvbiBDVEwu
CiAgICgzKSBWRklPIGRyaXZlciBsb2FkcyBOJ3RoIGNodW5rIG9mIGRldmljZSBtZW1vcnkgc25h
cHNob3QvZGlydHkgZGF0YQogICAgICAgZnJvbSByZWdpb24gREVWSUNFX01FTU9SWS4KCjEyLiBn
ZXQgc3lzdGVtIG1lbW9yeSBkaXJ0eSBiaXRtYXAKICAgKDEpIHVzZXIgc3BhY2UgY2FsbHMgd3Jp
dGUgc3lzdGVtIGNhbGwgdG8gc3BlY2lmeSBhIHJhbmdlIG9mIHN5c3RlbQogICAgICAgbWVtb3J5
IHRoYXQgcXVlcnlpbmcgZGlydHkgcGFnZXMuCiAgICAgICBzeXN0ZW0gbWVtb3J5J3Mgc3RhcnQg
YWRkcmVzcyAtLT4gInN5c3RlbV9tZW1vcnkuc3RhcnRfYWRkciIgZmllbGQKICAgICAgIG9mIHJl
Z2lvbiBDVEwsCiAgICAgICBzeXN0ZW0gbWVtb3J5J3MgcGFnZSBjb3VudCAtLT4gInN5c3RlbV9t
ZW1vcnkucGFnZV9uciIgZmllbGQgb2YKICAgICAgIHJlZ2lvbiBDVEwuCiAgICgyKSBpZiBkZXZp
Y2Ugc3RhdGUgaXMgbm90IGluIFJVTk5JTkcgb3IgU1RPUCAmIExPR0dJTkcsCiAgICAgICBWRklP
IGRyaXZlciByZXR1cm5zIGVtcHR5IGJpdG1hcDsgb3RoZXJ3aXNlLAogICAgICAgVkZJTyBkcml2
ZXIgY2hlY2tzIHRoZSBwYWdlX25yLAogICAgICAgaWYgaXQncyBsYXJnZXIgdGhhbiB0aGUgc2l6
ZSB0aGF0IHJlZ2lvbiBESVJUWV9CSVRNQVAgY2FuIHN1cHBvcnQsCiAgICAgICBlcnJvciByZXR1
cm5zOyBpZiBub3QsCiAgICAgICBWRklPIGRyaXZlciByZXR1cm5zIGFzIGJpdG1hcCB0byBzcGVj
aWZ5IGRpcnR5IHBhZ2VzIHRoYXQKICAgICAgIGRldmljZSBwcm9kdWNlcyBzaW5jZSBsYXN0IHF1
ZXJ5IGluIHRoaXMgcmFuZ2Ugb2Ygc3lzdGVtIG1lbW9yeSAuCiAgICgzKSB1c2VzcGFjZSByZWFk
cyBiYWNrIHRoZSBkaXJ0eSBiaXRtYXAgZnJvbSByZWdpb24gRElSVFlfQklUTUFQLgoKCkVYQU1Q
TEUgVVNBR0UKLS0tLS0tLS0tLS0tLQpUYWtlIGxpdmUgbWlncmF0aW9uIG9mIGEgVkZJTyBkZXZp
Y2UgYXMgYW4gZXhhbXBsZSB0byB1c2UgdGhvc2UgZGV2aWNlCnN0YXRlIGludGVyZmFjZXMuCgpM
aXZlIG1pZ3JhdGlvbiBzYXZlIHBhdGg6CgooUUVNVSBMSVZFIE1JR1JBVElPTiBTVEFURSAtLT4g
REVWSUNFIFNUQVRFIElOVEVSRkFDRSAtLT4gREVWSUNFIFNUQVRFKQoKTUlHUkFUSU9OX1NUQVRV
U19OT05FIC0tPiBWRklPX0RFVklDRV9TVEFURV9SVU5OSU5HCiB8Ck1JR1JBVElPTl9TVEFUVVNf
U0FWRV9TRVRVUAogfAogLnNhdmVfc2V0dXAgY2FsbGJhY2sgLS0+CiBnZXQgZGV2aWNlIG1lbW9y
eSBzaXplICh3aG9sZSBzbmFwc2hvdCBzaXplKQogZ2V0IGRldmljZSBtZW1vcnkgYnVmZmVyICh3
aG9sZSBzbmFwc2hvdCBkYXRhKQogc2V0IGRldmljZSBzdGF0ZSAtLT4gVkZJT19ERVZJQ0VfU1RB
VEVfUlVOTklORyAmIFZGSU9fREVWSUNFX1NUQVRFX0xPR0dJTkcKIHwKTUlHUkFUSU9OX1NUQVRV
U19BQ1RJVkUKIHwKIC5zYXZlX2xpdmVfcGVuZGluZyBjYWxsYmFjayAtLT4gZ2V0IGRldmljZSBt
ZW1vcnkgc2l6ZSAoZGlydHkgZGF0YSkKIC5zYXZlX2xpdmVfaXRlcmF0aW9uIGNhbGxiYWNrIC0t
PiBnZXQgZGV2aWNlIG1lbW9yeSBidWZmZXIgKGRpcnR5IGRhdGEpCiAubG9nX3N5bmMgY2FsbGJh
Y2sgLS0+IGdldCBzeXN0ZW0gbWVtb3J5IGRpcnR5IGJpdG1hcAogfAoodmNwdSBzdG9wcykgLS0+
IHNldCBkZXZpY2Ugc3RhdGUgLS0+CiBWRklPX0RFVklDRV9TVEFURV9TVE9QICYgVkZJT19ERVZJ
Q0VfU1RBVEVfTE9HR0lORwogfAouc2F2ZV9saXZlX2NvbXBsZXRlX3ByZWNvcHkgY2FsbGJhY2sg
LS0+CiBnZXQgZGV2aWNlIG1lbW9yeSBzaXplIChkaXJ0eSBkYXRhKQogZ2V0IGRldmljZSBtZW1v
cnkgYnVmZmVyIChkaXJ0eSBkYXRhKQogZ2V0IGRldmljZSBjb25maWcgc2l6ZSAod2hvbGUgc25h
cHNob3Qgc2l6ZSkKIGdldCBkZXZpY2UgY29uZmlnIGJ1ZmZlciAod2hvbGUgc25hcHNob3QgZGF0
YSkKIHwKLnNhdmVfY2xlYW51cCBjYWxsYmFjayAtLT4gIHNldCBkZXZpY2Ugc3RhdGUgLS0+IFZG
SU9fREVWSUNFX1NUQVRFX1NUT1AKTUlHUkFUSU9OX1NUQVRVU19DT01QTEVURUQKCk1JR1JBVElP
Tl9TVEFUVVNfQ0FOQ0VMTEVEIG9yCk1JR1JBVElPTl9TVEFUVVNfRkFJTEVECiB8Cih2Y3B1IHN0
YXJ0cykgLS0+IHNldCBkZXZpY2Ugc3RhdGUgLS0+IFZGSU9fREVWSUNFX1NUQVRFX1JVTk5JTkcK
CgpMaXZlIG1pZ3JhdGlvbiBsb2FkIHBhdGg6CgooUUVNVSBMSVZFIE1JR1JBVElPTiBTVEFURSAt
LT4gREVWSUNFIFNUQVRFIElOVEVSRkFDRSAtLT4gREVWSUNFIFNUQVRFKQoKTUlHUkFUSU9OX1NU
QVRVU19OT05FIC0tPiBWRklPX0RFVklDRV9TVEFURV9SVU5OSU5HCiB8Cih2Y3B1IHN0b3BzKSAt
LT4gc2V0IGRldmljZSBzdGF0ZSAtLT4gVkZJT19ERVZJQ0VfU1RBVEVfU1RPUAogfApNSUdSQVRJ
T05fU1RBVFVTX0FDVElWRQogfAoubG9hZCBzdGF0ZSBjYWxsYmFjayAtLT4KIHNldCBkZXZpY2Ug
bWVtb3J5IHNpemUsIHNldCBkZXZpY2UgbWVtb3J5IGJ1ZmZlciwgc2V0IGRldmljZSBjb25maWcg
c2l6ZSwKIHNldCBkZXZpY2UgY29uZmlnIGJ1ZmZlcgogfAoodmNwdSBzdGFydHMpIC0tPiBzZXQg
ZGV2aWNlIHN0YXRlIC0tPiBWRklPX0RFVklDRV9TVEFURV9SVU5OSU5HCiB8Ck1JR1JBVElPTl9T
VEFUVVNfQ09NUExFVEVECgoKUGF0Y2ggT3Jnbml6YXRpb24KPT09PT09PT09PT09PT09PT0KClRo
ZSBmaXJzdCA2IHBhdGNoZXMgbGV0IHZHUFUgdmlldyBpdHMgYmFzZSBnZ3R0IGFkZHJlc3MgYXMg
c3RhcnRpbmcgZnJvbQowLiBCZWZvcmUgdkdQVSBzdWJtaXR0aW5nIHdvcmtsb2FkcyB0byBIVywg
dHJhcCB2R1BVJ3Mgd29ya2xvYWRzLCBzY2FuCmNvbW1hbmRzIHRvIHBhdGNoIHRoZW0gdG8gc3Rh
cnQgZnJvbSBiYXNlIGFkZHJlc3Mgb2YgdGhlIGdndHQgcGFydGl0aW9uCmFzc2lnZ25lZCB0byB0
aGUgdkdQVS4KClRoZSBsYXR0ZXIgdHdvIHBhdGNoZXMgaW1wbGVtZW50cyB0aGUgVkZJTyBkZXZp
Y2Ugc3RhdGVzIGludGVyZmFjZXMuClBhdGNoIDcgaW1wbGVtZW50cyBsb2FkaW5nIGRldmljZSBj
b25maWcgZGF0YSBmcm9tIHZHUFUgYW5kIHJlc3RvcmluZwpkZXZpY2UgY29uZmlnIGRhdGEgaW50
byB2R1BVIHRocm91Z2ggR1ZUJ3MgaW50ZXJuYWwgaW50ZXJmYWNlCmludGVsX2d2dF9zYXZlX3Jl
c3RvcmUuCgpQYXRjaCA4IGV4cG9zZXMgZGV2aWNlIHN0YXRlcyBpbnRlcmZhY2VzIHRvIHVzZXJz
cGFjZSBWRklPIHRocm91Z2ggVkZJTwpyZWdpb25zIG9mIHR5cGUgVkZJT19SRUdJT05fVFlQRV9E
RVZJQ0VfU1RBVEUuIFRocm91Z2ggdGhvc2UgcmVnaW9ucywgdXNlcgpzcGFjZSBWRklPIGNhbiBn
ZXQvc2V0IGRldmljZSdzIHN0YXRlIGFuZCBkYXRhLgoKCllhbiBaaGFvICgyKToKICBkcm0vaTkx
NS9ndnQ6IHZHUFUgZGV2aWNlIGNvbmZpZyBkYXRhIHNhdmUvcmVzdG9yZSBpbnRlcmZhY2UKICBk
cm0vaTkxNS9ndnQ6IFZGSU8gZGV2aWNlIHN0YXRlcyBpbnRlcmZhY2VzCgpZdWxlaSBaaGFuZyAo
Nik6CiAgZHJtL2k5MTUvZ3Z0OiBBcHBseSBnMmggYWRqdXN0IGZvciBHVFQgbW1pbyBhY2Nlc3MK
ICBkcm0vaTkxNS9ndnQ6IEFwcGx5IGcyaCBhZGp1c3RtZW50IGR1cmluZyBmZW5jZSBtbWlvIGFj
Y2VzcwogIGRybS9pOTE1L2d2dDogUGF0Y2ggdGhlIGdtYSBpbiBncHUgY29tbWFuZHMgZHVyaW5n
IGNvbW1hbmQgcGFyc2VyCiAgZHJtL2k5MTUvZ3Z0OiBSZXRyaWV2ZSB0aGUgZ3Vlc3QgZ20gYmFz
ZSBhZGRyZXNzIGZyb20gUFZJTkZPCiAgZHJtL2k5MTUvZ3Z0OiBBbGlnbiB0aGUgZ3Vlc3QgZ20g
YXBlcnR1cmUgc3RhcnQgb2Zmc2V0IGZvciBsaXZlCiAgICBtaWdyYXRpb24KICBkcm0vaTkxNS9n
dnQ6IEFwcGx5IGcyaCBhZGp1c3RtZW50IHRvIGJ1ZmZlciBzdGFydCBnbWEgZm9yIGRtYWJ1ZgoK
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9NYWtlZmlsZSAgICAgIHwgICAyICstCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9ndnQvYXBlcnR1cmVfZ20uYyB8ICAgNiArLQogZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L2NmZ19zcGFjZS5jICAgfCAgIDMgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9jbWRfcGFyc2VyLmMgIHwgIDMxICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVm
LmMgICAgICB8ICAgMyArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZXhlY2xpc3QuYyAgICB8
ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2d0dC5jICAgICAgICAgfCAgMjUgKy0K
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9ndHQuaCAgICAgICAgIHwgICAzICsKIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9ndnQuYyAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2d2dC9ndnQuaCAgICAgICAgIHwgIDQ4ICstCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQv
a3ZtZ3QuYyAgICAgICB8IDQxNCArKysrKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2
dC9taWdyYXRlLmMgICAgIHwgODYzICsrKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2d2dC9taWdyYXRlLmggICAgIHwgIDk3ICsrKwogZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Z0L21taW8uYyAgICAgICAgfCAgMTMgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0
L21taW8uaCAgICAgICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L3ZncHUuYyAg
ICAgICAgfCAgMTEgKy0KIGluY2x1ZGUvdWFwaS9saW51eC92ZmlvLmggICAgICAgICAgICAgIHwg
IDM4ICsrCiAxNyBmaWxlcyBjaGFuZ2VkLCAxNTExIGluc2VydGlvbnMoKyksIDUwIGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9taWdyYXRl
LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvbWlncmF0ZS5o
CgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppbnRlbC1ndnQtZGV2IG1haWxpbmcgbGlzdAppbnRlbC1ndnQtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2ludGVsLWd2dC1kZXY=
