// Initial wiring: [17, 16, 3, 2, 5, 10, 11, 1, 6, 8, 0, 9, 14, 12, 15, 18, 13, 19, 4, 7]
// Resulting wiring: [17, 16, 3, 2, 5, 10, 11, 1, 6, 8, 0, 9, 14, 12, 15, 18, 13, 19, 4, 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[3], q[2];
cx q[7], q[2];
cx q[8], q[7];
cx q[8], q[1];
cx q[11], q[10];
cx q[15], q[13];
cx q[17], q[16];
cx q[16], q[14];
cx q[17], q[11];
cx q[18], q[17];
cx q[17], q[16];
cx q[16], q[14];
cx q[14], q[5];
cx q[5], q[3];
cx q[18], q[11];
cx q[19], q[18];
cx q[8], q[11];
cx q[0], q[1];
