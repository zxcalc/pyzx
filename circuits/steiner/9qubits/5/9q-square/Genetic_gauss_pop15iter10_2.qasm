// Initial wiring: [0 1 2 7 3 5 8 6 4]
// Resulting wiring: [0 1 2 7 3 5 8 6 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[4], q[3];
cx q[3], q[4];
cx q[3], q[8];
