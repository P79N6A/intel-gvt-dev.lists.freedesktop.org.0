Delivered-To: linux.kernel.mailinglists@gmail.com
Received: by 2002:a81:ed4:0:0:0:0:0 with SMTP id 203csp414851ywo;
        Mon, 1 Apr 2019 07:15:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwblufzN4l2tmqcuCnd0YneojjtstV2ZTUGl3Dw6DLKSyxQWuJuT+CBZaC7ENNmGRo0w4GR
X-Received: by 2002:a17:902:7242:: with SMTP id c2mr28133023pll.245.1554128133031;
        Mon, 01 Apr 2019 07:15:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554128133; cv=none;
        d=google.com; s=arc-20160816;
        b=ZJK9v47q1i0ZQ34njC8x2/iqdoEj7ntwBXxKRfVW0Q4ZEzuN5+ARvOYAs5lc/BRMqw
         R3EK7DGJx9Lp0X4xzQERXIJ/XSrJ6xZJ8Bwjt7/pW4fLin/nHnLCQ5hjmhsl6l0zO0fq
         nnpLYoXNwBYF4Jj1U/WJDYzrT1Es9RrrC9rhJAj4FVZqqAwAxVJCEXt9VoJFsUpefjmj
         +r+4lVm5FzfnYa6gLnCvX1gplGLb9hFuC+QMhH8zhlUciMX/d4VqxTGPx1aRIl4HqwWi
         yxFkb2Ioxq0rJ0P1sW0UyAeo+9AQ1q5yGvmsRYNFtnQjRH28Am3VebRIesz0unUsHnpH
         CZEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:cc:list-subscribe
         :list-help:list-post:list-archive:list-unsubscribe:list-id
         :precedence:mime-version:organization:references:in-reply-to
         :message-id:subject:to:from:date:delivered-to;
        bh=KwHocP7iB9V/8HV0SRaTSKcN+VoqMl5kd2u6jzTEkLE=;
        b=vguUNW2Kyq9ZiP7GV7seDUGDoMzai/E+a6bxCvEhhzrp2fVi4ip5TaXVk+4ymHd9/R
         GMwBAk26z4PfwR1WheECOgo5sdUQ0GdqEyBjH7Lv7Ptjptn+cIM1XUK24xNB1FLY+EZR
         zqLlohb95DGRoogm8cTf3znJ8XfstmUfIKvsr5kAFeahSvakJiMI2oiaq42ORwNxxdLm
         XbpdsLbO6q1Trlkfz+MYA8zTMc2UMqze5LkIzfD2GgYctHJUSddXJwH+RxTzhaw94MSy
         4ecLNIjRGpM7cqFW9NkG5/ivL23Nf7z503a12GpIB/G1dvdqVU9kfdEM3U10n++Ib0OH
         kPSg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <intel-gvt-dev-bounces@lists.freedesktop.org>
Received: from gabe.freedesktop.org (gabe.freedesktop.org. [131.252.210.177])
        by mx.google.com with ESMTPS id g126si8742414pgc.75.2019.04.01.07.15.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Apr 2019 07:15:33 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) client-ip=131.252.210.177;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of intel-gvt-dev-bounces@lists.freedesktop.org designates 131.252.210.177 as permitted sender) smtp.mailfrom=intel-gvt-dev-bounces@lists.freedesktop.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383C76E6B8;
	Mon,  1 Apr 2019 14:15:32 +0000 (UTC)
X-Original-To: intel-gvt-dev@lists.freedesktop.org
Delivered-To: intel-gvt-dev@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B1A6E6B8
 for <intel-gvt-dev@lists.freedesktop.org>;
 Mon,  1 Apr 2019 14:15:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F2926308403F;
 Mon,  1 Apr 2019 14:15:29 +0000 (UTC)
Received: from x1.home (ovpn-116-99.phx2.redhat.com [10.3.116.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4006560141;
 Mon,  1 Apr 2019 14:15:27 +0000 (UTC)
Date: Mon, 1 Apr 2019 08:15:26 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Subject: Re: [PATCH 0/5] QEMU VFIO live migration
Message-ID: <20190401081526.5f50d160@x1.home>
In-Reply-To: <20190401084003.GA1530@joy-OptiPlex-7040>
References: <1550566254-3545-1-git-send-email-yan.y.zhao@intel.com>
 <20190219113212.GC2941@work-vm>
 <20190220052838.GC16456@joy-OptiPlex-7040>
 <20190220110142.GD2608@work-vm>
 <33183CC9F5247A488A2544077AF19020DB25D30F@dggeml511-mbx.china.huawei.com>
 <20190220124242.5a1685c5.cohuck@redhat.com>
 <20190327063509.GD14681@joy-OptiPlex-7040>
 <20190327201854.GG2636@work-vm> <20190327161020.1c013e65@x1.home>
 <20190401101430.72d2ef9e.cohuck@redhat.com>
 <20190401084003.GA1530@joy-OptiPlex-7040>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Mon, 01 Apr 2019 14:15:31 +0000 (UTC)
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
Cc: "cjia@nvidia.com" <cjia@nvidia.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "Zhengxiao.zx@alibaba-inc.com" <Zhengxiao.zx@alibaba-inc.com>,
 "shuangtai.tst@alibaba-inc.com" <shuangtai.tst@alibaba-inc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "eauger@redhat.com" <eauger@redhat.com>, "Liu, Yi
 L" <yi.l.liu@intel.com>, "eskultet@redhat.com" <eskultet@redhat.com>, "Yang,
 Ziye" <ziye.yang@intel.com>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 "felipe@nutanix.com" <felipe@nutanix.com>, "Ken.Xue@amd.com" <Ken.Xue@amd.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "Liu, Changpeng" <changpeng.liu@intel.com>, Cornelia Huck <cohuck@redhat.com>,
 "Wang, Zhi A" <zhi.a.wang@intel.com>,
 "jonathan.davies@nutanix.com" <jonathan.davies@nutanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gvt-dev-bounces@lists.freedesktop.org
Sender: "intel-gvt-dev" <intel-gvt-dev-bounces@lists.freedesktop.org>

T24gTW9uLCAxIEFwciAyMDE5IDA0OjQwOjAzIC0wNDAwCllhbiBaaGFvIDx5YW4ueS56aGFvQGlu
dGVsLmNvbT4gd3JvdGU6Cgo+IE9uIE1vbiwgQXByIDAxLCAyMDE5IGF0IDA0OjE0OjMwUE0gKzA4
MDAsIENvcm5lbGlhIEh1Y2sgd3JvdGU6Cj4gPiBPbiBXZWQsIDI3IE1hciAyMDE5IDE2OjEwOjIw
IC0wNjAwCj4gPiBBbGV4IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPiB3
cm90ZToKPiA+ICAgCj4gPiA+IE9uIFdlZCwgMjcgTWFyIDIwMTkgMjA6MTg6NTQgKzAwMDAKPiA+
ID4gIkRyLiBEYXZpZCBBbGFuIEdpbGJlcnQiIDxkZ2lsYmVydEByZWRoYXQuY29tPiB3cm90ZToK
PiA+ID4gICAKPiA+ID4gPiAqIFpoYW8gWWFuICh5YW4ueS56aGFvQGludGVsLmNvbSkgd3JvdGU6
ICAgIAo+ID4gPiA+ID4gT24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMDc6NDI6NDJQTSArMDgwMCwg
Q29ybmVsaWEgSHVjayB3cm90ZTogICAgICAKPiA+ID4gPiA+ID4gPiA+ID4gPiAgIGIpIEhvdyBk
byB3ZSBkZXRlY3QgaWYgd2UncmUgbWlncmF0aW5nIGZyb20vdG8gdGhlIHdyb25nIGRldmljZSBv
cgo+ID4gPiA+ID4gPiA+ID4gPiA+IHZlcnNpb24gb2YgZGV2aWNlPyAgT3Igc2F5IHRvIGEgZGV2
aWNlIHdpdGggb2xkZXIgZmlybXdhcmUgb3IgcGVyaGFwcwo+ID4gPiA+ID4gPiA+ID4gPiA+IGEg
ZGV2aWNlIHRoYXQgaGFzIGxlc3MgZGV2aWNlIG1lbW9yeSA/ICAgICAgICAKPiA+ID4gPiA+ID4g
PiA+ID4gQWN0dWFsbHkgaXQncyBzdGlsbCBhbiBvcGVuIGZvciBWRklPIG1pZ3JhdGlvbi4gTmVl
ZCB0byB0aGluayBhYm91dAo+ID4gPiA+ID4gPiA+ID4gPiB3aGV0aGVyIGl0J3MgYmV0dGVyIHRv
IGNoZWNrIHRoYXQgaW4gbGlidmlydCBvciBxZW11IChsaWtlIGEgZGV2aWNlIG1hZ2ljCj4gPiA+
ID4gPiA+ID4gPiA+IGFsb25nIHdpdGggdmVyaW9uID8pLiAgICAgICAgCj4gPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+ID4gV2UgbXVzdCBrZWVwIHRoZSBoYXJkd2FyZSBnZW5lcmF0aW9uIGlzIHRo
ZSBzYW1lIHdpdGggb25lIFBPRCBvZiBwdWJsaWMgY2xvdWQKPiA+ID4gPiA+ID4gPiBwcm92aWRl
cnMuIEJ1dCB3ZSBzdGlsbCB0aGluayBhYm91dCB0aGUgbGl2ZSBtaWdyYXRpb24gYmV0d2VlbiBm
cm9tIHRoZSB0aGUgbG93ZXIKPiA+ID4gPiA+ID4gPiBnZW5lcmF0aW9uIG9mIGhhcmR3YXJlIG1p
Z3JhdGVkIHRvIHRoZSBoaWdoZXIgZ2VuZXJhdGlvbi4gICAgICAKPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+IEFncmVlZCwgbG93ZXItPmhpZ2hlciBpcyB0aGUgb25lIGRpcmVjdGlvbiB0aGF0IG1p
Z2h0IG1ha2Ugc2Vuc2UgdG8KPiA+ID4gPiA+ID4gc3VwcG9ydC4KPiA+ID4gPiA+ID4gCj4gPiA+
ID4gPiA+IEJ1dCByZWdhcmRsZXNzIG9mIHRoYXQsIEkgdGhpbmsgd2UgbmVlZCB0byBtYWtlIHN1
cmUgdGhhdCBpbmNvbXBhdGlibGUKPiA+ID4gPiA+ID4gZGV2aWNlcy92ZXJzaW9ucyBmYWlsIGRp
cmVjdGx5IGluc3RlYWQgb2YgZmFpbGluZyBpbiBhIHN1YnRsZSwgaGFyZCB0bwo+ID4gPiA+ID4g
PiBkZWJ1ZyB3YXkuIE1pZ2h0IGJlIHVzZWZ1bCB0byBkbyBzb21lIGluaXRpYWwgc2FuaXR5IGNo
ZWNrcyBpbiBsaWJ2aXJ0Cj4gPiA+ID4gPiA+IGFzIHdlbGwuCj4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiBIb3cgZWFzeSBpcyBpdCB0byBvYnRhaW4gdGhhdCBpbmZvcm1hdGlvbiBpbiBhIGZvcm0g
dGhhdCBjYW4gYmUKPiA+ID4gPiA+ID4gY29uc3VtZWQgYnkgaGlnaGVyIGxheWVycz8gQ2FuIHdl
IGZpbmQgb3V0IHRoZSBkZXZpY2UgdHlwZSBhdCBsZWFzdD8KPiA+ID4gPiA+ID4gV2hhdCBhYm91
dCBzb21lIGtpbmQgb2YgcmV2aXNpb24/ICAgICAgCj4gPiA+ID4gPiBoaSBBbGV4IGFuZCBDb3Ju
ZWxpYQo+ID4gPiA+ID4gZm9yIGRldmljZSBjb21wYXRpYmlsaXR5LCBkbyB5b3UgdGhpbmsgaXQn
cyBhIGdvb2QgaWRlYSB0byB1c2UgInZlcnNpb24iCj4gPiA+ID4gPiBhbmQgImRldmljZSB2ZXJz
aW9uIiBmaWVsZHM/Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IHZlcnNpb24gZmllbGQ6IGlkZW50aWZ5
IGxpdmUgbWlncmF0aW9uIGludGVyZmFjZSdzIHZlcnNpb24uIGl0IGNhbiBoYXZlIGEKPiA+ID4g
PiA+IHNvcnQgb2YgYmFja3dhcmQgY29tcGF0aWJpbGl0eSwgbGlrZSB0YXJnZXQgbWFjaGluZSdz
IHZlcnNpb24gPj0gc291cmNlCj4gPiA+ID4gPiBtYWNoaW5lJ3MgdmVyc2lvbi4gc29tZXRoaW5n
IGxpa2UgdGhhdC4gICAgCj4gPiA+IAo+ID4gPiBEb24ndCB3ZSBlc3NlbnRpYWxseSBhbHJlYWR5
IGhhdmUgdGhpcyB2aWEgdGhlIGRldmljZSBzcGVjaWZpYyByZWdpb24/Cj4gPiA+IFRoZSBzdHJ1
Y3QgdmZpb19pbmZvX2NhcF9oZWFkZXIgaW5jbHVkZXMgaWQgYW5kIHZlcnNpb24gZmllbGRzLCBz
byB3ZQo+ID4gPiBjYW4gZGVjbGFyZSBhIG1pZ3JhdGlvbiBpZCBhbmQgaW5jcmVtZW50IHRoZSB2
ZXJzaW9uIGZvciBhbnkKPiA+ID4gaW5jb21wYXRpYmxlIGNoYW5nZXMgdG8gdGhlIHByb3RvY29s
Lgo+ID4gPiAgIAo+ID4gPiA+ID4gCj4gPiA+ID4gPiBkZXZpY2VfdmVyc2lvbiBmaWVsZCBjb25z
aXN0cyB0d28gcGFydHM6Cj4gPiA+ID4gPiAxLiB2ZW5kb3IgaWQgOiBpdCB0YWtlcyAzMiBiaXRz
LiBlLmcuIDB4ODA4Ni4gICAgCj4gPiA+IAo+ID4gPiBXaG8gYWxsb2NhdGVzIElEcz8gIElmIHdl
J3JlIGdvaW5nIHRvIHVzZSBQQ0kgdmVuZG9yIElEcywgdGhlbiBJJ2QKPiA+ID4gc3VnZ2VzdCB3
ZSB1c2UgYSBiaXQgdG8gZmxhZyBpdCBhcyBzdWNoIHNvIHdlIGNhbiByZXNlcnZlIHRoYXQgcG9y
dGlvbgo+ID4gPiBvZiB0aGUgMzJiaXQgYWRkcmVzcyBzcGFjZS4gIFNlZSBmb3IgZXhhbXBsZToK
PiA+ID4gCj4gPiA+ICNkZWZpbmUgVkZJT19SRUdJT05fVFlQRV9QQ0lfVkVORE9SX1RZUEUgICAg
ICAgICgxIDw8IDMxKQo+ID4gPiAjZGVmaW5lIFZGSU9fUkVHSU9OX1RZUEVfUENJX1ZFTkRPUl9N
QVNLICAgICAgICAoMHhmZmZmKQo+ID4gPiAKPiA+ID4gRm9yIHZlbmRvciBzcGVjaWZpYyByZWdp
b25zLiAgCj4gPiAKPiA+IEp1c3QgYnJvd3NpbmcgdGhyb3VnaCB0aGUgdGhyZWFkLi4uIGlmIEkg
ZG9uJ3QgbWlzdW5kZXJzdGFuZCwgd2UgY291bGQKPiA+IHVzZSBhIHZmaW8tY2N3IHJlZ2lvbiB0
eXBlIGlkIGhlcmUgZm9yIGNjdywgY291bGRuJ3Qgd2U/IEp1c3QgdG8gbWFrZQo+ID4gc3VyZSB0
aGF0IHRoaXMgaXMgbm90IHBjaS1zcGVjaWZpYy4gIAo+IENDVyBjb3VsZCB1c2UgYW5vdGhlciBi
aXQgb3RoZXIgdGhhbiBiaXQgMzE/Cj4gZS5nLgo+ICNkZWZpbmUgVkZJT19SRUdJT05fVFlQRV9D
Q1dfVkVORE9SX1RZUEUgICAgICAgICgxIDw8IDMwKQo+IHRoZW4gY2N3IGRldmljZSB1c2UgKFZG
SU9fUkVHSU9OX1RZUEVfQ0NXX1ZFTkRPUl9UWVBFIHwgdmVuZG9yIGlkKSBhcyBpdHMKPiBmaXJz
dCAzMiBiaXQgZm9yIGRldmljZSB2ZXJzaW9uIHN0cmluZy4KPiAKPiBCdXQgYXMgQWxleCBzYWlk
IHdlJ2xsIG5vdCBwcm92aWRlIGFuIGV4dHJhIHJlZ2lvbiB0byBnZXQgZGV2aWNlIHZlcnNpb24s
Cj4gYW5kIGRldmljZSB2ZXJzaW9uIGlzIG9ubHkgZXhwb3J0ZWQgaW4gc3lzZnMsIHByb2JhYmx5
IHdlIHNob3VsZCBkZWZpbmUgdGhlbSBhcwo+IGJlbG93Ogo+ICNkZWZpbmUgVkZJT19ERVZJQ0Vf
VkVSU0lPTl9UWVBFX1BDSSAoMTw8MzEpCj4gI2RlZmluZSBWRklPX0RFVklDRV9WRVJTSU9OX1RZ
UEVfQ0NXICgxPDwzMCkKPiAKPiBEbyB5b3UgdGhpbmsgaXQncyBvaz8KCldlIGFscmVhZHkgaGFk
IHRoaXMgZGlzY3Vzc2lvbiBmb3IgZGV2aWNlIHNwZWNpZmljIHJlZ2lvbnMgYW5kIGRlY2lkZWQK
dGhhdCBDQ1cgZG9lc24ndCBoYXZlIGVub3VnaCB2ZW5kb3JzIHRvIGp1c3RpZnkgYSBmdWxsIHN1
YnNldCBvZiB0aGUKYXZhaWxhYmxlIGFkZHJlc3Mgc3BhY2UuICBBbHNvLCB0aGlzIGRvZXNuJ3Qg
bmVlZCB0byBpbXBseSB0aGUgZGV2aWNlCmludGVyZmFjZSwgd2UncmUgc2ltcGx5IHNwZWNpZnlp
bmcgYSB2ZW5kb3IgcmVnaXN0cmFyIHN1Y2ggdGhhdCB3ZSBjYW4KZ2l2ZSBlYWNoIHZlbmRvciB0
aGVpciBvd24gbmFtZXNwYWNlLCBzbyBJIGRvbid0IHRoaW5rIGl0IHdvdWxkIGJlIGEKcHJvYmxl
bSBmb3IgYSBDQ1cgdG8gc3BlY2lmeSBhIG5hbWVzcGFjZSB1c2luZyBhIFBDSSB2ZW5kb3IgSUQu
CkZpbmFsbHksIGlmIHdlIGhhdmUgc3VjaCBuZWVkIGZvciB0aGlzIGluIHRoZSBmdXR1cmUsIGJl
Y2F1c2UgSSdtIG5vdApzdXJlIHdoZXJlIHdlIHN0YW5kIHdpdGggdGhpcyBpbiB0aGUgY3VycmVu
dCBwcm9wb3NhbHMsIG1heWJlIHdlIHNob3VsZAptYWtlIHVzZSBvZiBhbiBJRUVFIE9VSSByYXRo
ZXIgdGhhbiBhIFBDSSBkYXRhYmFzZSB0byBhdm9pZCB0aGlzIHNvcnQKb2YgY29uZnVzaW9uIGFu
ZCBtaXMtYXNzb2NpYXRpb24gaWYgd2UgaGF2ZSBmdXJ0aGVyIG5lZWQuICBUaGFua3MsCgpBbGV4
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmludGVsLWd2
dC1kZXYgbWFpbGluZyBsaXN0CmludGVsLWd2dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ3Z0LWRl
dg==
