// Initial wiring: [0 2 3 8 4 6 5 7 1]
// Resulting wiring: [0 2 3 8 5 6 4 7 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[3];
cx q[4], q[1];
