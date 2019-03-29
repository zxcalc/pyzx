// Initial wiring: [19, 18, 14, 11, 2, 16, 8, 17, 5, 9, 15, 6, 7, 10, 0, 1, 4, 12, 13, 3]
// Resulting wiring: [19, 18, 14, 11, 2, 16, 8, 17, 5, 9, 15, 6, 7, 10, 0, 1, 4, 12, 13, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[2];
cx q[13], q[12];
cx q[13], q[7];
cx q[13], q[6];
cx q[14], q[13];
cx q[13], q[7];
cx q[13], q[6];
cx q[14], q[5];
cx q[15], q[14];
cx q[18], q[19];
cx q[8], q[10];
cx q[5], q[14];
cx q[4], q[6];
cx q[6], q[7];
cx q[3], q[6];
cx q[6], q[12];
cx q[2], q[3];
cx q[3], q[6];
cx q[6], q[12];
cx q[3], q[5];
cx q[12], q[18];
cx q[5], q[14];
cx q[14], q[5];
cx q[18], q[12];
