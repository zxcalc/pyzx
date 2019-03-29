// Initial wiring: [15, 17, 9, 8, 5, 11, 19, 2, 12, 18, 4, 3, 1, 16, 6, 13, 10, 7, 0, 14]
// Resulting wiring: [15, 17, 9, 8, 5, 11, 19, 2, 12, 18, 4, 3, 1, 16, 6, 13, 10, 7, 0, 14]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[8], q[1];
cx q[10], q[9];
cx q[14], q[13];
cx q[15], q[13];
cx q[13], q[7];
cx q[7], q[1];
cx q[13], q[6];
cx q[13], q[7];
cx q[16], q[14];
cx q[18], q[17];
cx q[18], q[12];
cx q[19], q[18];
cx q[12], q[18];
cx q[8], q[9];
cx q[7], q[12];
cx q[6], q[12];
cx q[2], q[7];
cx q[7], q[12];
cx q[12], q[18];
cx q[18], q[12];
