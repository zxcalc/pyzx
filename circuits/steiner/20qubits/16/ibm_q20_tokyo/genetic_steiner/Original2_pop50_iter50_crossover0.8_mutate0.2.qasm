// Initial wiring: [19, 8, 3, 15, 9, 2, 13, 12, 6, 0, 14, 4, 16, 1, 17, 5, 18, 7, 10, 11]
// Resulting wiring: [19, 8, 3, 15, 9, 2, 13, 12, 6, 0, 14, 4, 16, 1, 17, 5, 18, 7, 10, 11]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[5], q[3];
cx q[6], q[3];
cx q[7], q[6];
cx q[9], q[8];
cx q[8], q[1];
cx q[13], q[12];
cx q[18], q[19];
cx q[13], q[14];
cx q[12], q[17];
cx q[9], q[11];
cx q[7], q[12];
cx q[12], q[17];
cx q[5], q[6];
cx q[6], q[12];
cx q[12], q[18];
cx q[18], q[19];
cx q[4], q[5];
cx q[2], q[7];
