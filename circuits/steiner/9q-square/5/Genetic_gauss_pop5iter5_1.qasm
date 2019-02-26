// Initial wiring: [0 4 2 3 7 5 6 1 8]
// Resulting wiring: [0 5 1 3 7 4 6 2 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[1], q[2];
cx q[1], q[2];
cx q[1], q[0];
cx q[4], q[7];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[1], q[4];
