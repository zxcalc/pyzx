// Initial wiring: [0 5 2 8 1 3 6 7 4]
// Resulting wiring: [0 5 2 8 1 3 6 7 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[6], q[5];
cx q[0], q[1];
cx q[3], q[4];
cx q[6], q[7];
