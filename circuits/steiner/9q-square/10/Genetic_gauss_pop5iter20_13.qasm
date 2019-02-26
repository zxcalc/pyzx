// Initial wiring: [0 4 2 7 3 5 6 1 8]
// Resulting wiring: [0 5 2 7 3 4 6 1 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[1], q[2];
cx q[3], q[8];
cx q[0], q[5];
cx q[7], q[6];
cx q[6], q[7];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[2], q[3];
cx q[7], q[4];
